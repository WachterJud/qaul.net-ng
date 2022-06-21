library email_logging_coordinator;

import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mailto/mailto.dart';
import 'package:neat_periodic_task/neat_periodic_task.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qaul_rpc/qaul_rpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

part 'info_provider.dart';

part 'log_storage_manager.dart';

class EmailLoggingCoordinator {
  EmailLoggingCoordinator._();

  static final instance = EmailLoggingCoordinator._();

  final _log = Logger('EmailLoggingCoordinator');

  String get _supportEmail => 'debug@qaul.net';

  Future<void> initialize({Reader? reader}) async {
    await _initializeEnabledStatus(reader: reader);

    _reportLogMessages();
    _reportErrorsCaughtByFlutterFramework();
    await _reportUncaughtErrorsOfTheIsolate();
  }

  // ***************************************************************************
  // Log reporting subscriptions/callbacks
  // ***************************************************************************
  void _reportLogMessages() {
    Logger.root.onRecord.listen((record) {
      var message =
          '[${record.level.name}] ${record.loggerName}\t(${record.time}): ${record.message}';
      if (kDebugMode) debugPrint(message);

      if (record.level >= Level.WARNING) {
        _logError(record.object!, stack: record.stackTrace, message: message);
      }
    });
  }

  void _reportErrorsCaughtByFlutterFramework() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      _logError(details.exception, stack: details.stack);
    };
  }

  Future<void> _reportUncaughtErrorsOfTheIsolate() async {
    Isolate.current.addErrorListener(RawReceivePort((err) async {
      final error = (err as List<String?>).first!;
      final stack = err.last == null ? null : StackTrace.fromString(err.last!);
      _log.warning('error caught outside of isolate', error, stack);
      await _logError(error, stack: stack);
    }).sendPort);
  }

  // ***************************************************************************
  // Enable/disable logging logic
  // ***************************************************************************
  static const _loggingEnabledKey = 'loggingEnabledKey';

  Future<void> _initializeEnabledStatus({Reader? reader}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_loggingEnabledKey)) {
      _enabled = prefs.getBool(_loggingEnabledKey) ?? true;
    }
    _log.config('logger initialized with enabled status: $_enabled');
    if (reader != null) _setLibqaulLoggingState(_enabled, reader: reader);
  }

  bool get loggingEnabled => _enabled;
  bool _enabled = true;

  void setLoggingEnabled(bool enabled, {Reader? reader}) {
    _enabled = enabled;
    _storeLoggingOption();
    if (reader != null) _setLibqaulLoggingState(enabled, reader: reader);
  }

  void _storeLoggingOption() async {
    _log.fine('updating logging enabled status: $_enabled');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_loggingEnabledKey, _enabled);
  }

  void _setLibqaulLoggingState(bool enabled, {required Reader reader}) async {
    reader(qaulWorkerProvider).setLibqaulLogging(enabled);
  }

  // ***************************************************************************
  // Log creation/storage
  // ***************************************************************************
  final _storageManager = _LogStorageManager();

  Future<bool> get hasLogsStored async => !(await _storageManager.isEmpty);

  Future<String> get logStorageSize async {
    final size = await _storageManager.logFolderSize;
    return filesize(size);
  }

  Future<void> _logError(Object e, {StackTrace? stack, String? message}) async {
    if (!loggingEnabled) return;
    final log = await _buildLogContent(e, stack, message ?? '-');
    _storageManager.storeLog(_LogEntry(_buildTitle(e), log));
  }

  String _buildTitle(Object e) =>
      '${_storageManager.titlePrefix}-${e.runtimeType.toString().trim().replaceAll(' ', '_')}-${DateTime.now().millisecondsSinceEpoch}';

  Future<String> _buildLogContent(
      Object e, StackTrace? stack, String msg) async {
    return '''
Error/Exception: $e

Message: $msg

App Details:
${await _InfoProvider.getPackageInfo()}

Device Details:
${await _InfoProvider.getDeviceInfo()}

Stack Trace:
${stack ?? 'Not available'}
''';
  }

  // ***************************************************************************
  // API
  // ***************************************************************************
  Future<void> deleteLogs() async =>
      _storageManager.deleteLogs(await _storageManager.logs);

  Future<void> sendLogs({Reader? reader}) async {
    if (!loggingEnabled) return;
    List<FileSystemEntity>? libqaulLogs;
    if (reader != null && reader(libqaulLogsStoragePath) != null) {
      libqaulLogs = _getLibqaulLogs(reader(libqaulLogsStoragePath)!);
    }
    (Platform.isAndroid || Platform.isIOS)
        ? await _sendMobileLogs(libqaulAttachments: libqaulLogs)
        : await _sendDesktopLogs(libqaulAttachments: libqaulLogs);
  }

  List<FileSystemEntity> _getLibqaulLogs(String path) =>
      Directory(path).listSync();

  Future<void> _sendMobileLogs(
      {List<FileSystemEntity>? libqaulAttachments}) async {
    _log.fine('(MOBILE) sending logs via deafult mail app');
    var attachments = (await _storageManager.logs).map((e) => e.path).toList();
    if (libqaulAttachments != null && libqaulAttachments.isNotEmpty) {
      for (final log in libqaulAttachments) {
        if (_pathLeadsToLogFile(log)) attachments.add(log.path);
      }
    }
    final email = Email(
      body: 'Customer Feedback - Error/Exception Logs',
      subject: 'Customer Feedback - Error/Exception Logs',
      recipients: [_supportEmail],
      attachmentPaths: attachments,
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  Future<void> _sendDesktopLogs(
      {List<FileSystemEntity>? libqaulAttachments}) async {
    _log.fine('(DESKTOP) sending logs via mailto link');
    final mailtoLink = Mailto(
      to: [_supportEmail],
      body: await _buildDesktopEmail(libqaulAttachments: libqaulAttachments),
      subject: 'Customer Feedback - Error/Exception Logs',
    );
    await launch('$mailtoLink');
  }

  Future<String> _buildDesktopEmail(
      {List<FileSystemEntity>? libqaulAttachments}) async {
    var body = 'Customer Feedback - Error/Exception Logs\n\n\n${'#' * 100}\n\n';
    for (final log in (await _storageManager.logs)) {
      body += _storageManager.logContents(log) + '\n${'#' * 100}\n\n';
    }
    if (libqaulAttachments != null && libqaulAttachments.isNotEmpty) {
      for (final log in libqaulAttachments) {
        if (_pathLeadsToLogFile(log)) {
          body += 'Libqaul log << ${log.path.split('/').last} >>:\n';
          body += File(log.path).readAsStringSync() + '\n${'#' * 100}\n\n';
        }
      }
    }
    return body;
  }

  bool _pathLeadsToLogFile(FileSystemEntity log) {
    return FileSystemEntity.typeSync(log.path) == FileSystemEntityType.file &&
        log.path.endsWith(".log");
  }
}
