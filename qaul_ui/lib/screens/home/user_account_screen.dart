import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qaul_rpc/qaul_rpc.dart';

import '../../decorators/cron_task_decorator.dart';
import '../../widgets/widgets.dart';

class UserAccountScreen extends HookConsumerWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(defaultUserProvider);
    final nodeInfo = ref.watch(nodeInfoProvider);
    final bleStatus = ref.watch(bleStatusProvider);

    final bleData = useMemoized<List<String>>(() {
      return [
        'BLE ID: ${bleStatus?.idBase58 ?? 'Unknown'}',
        'BLE Status: ${bleStatus?.status ?? 'Unknown'}',
        'Node Info ID: ${bleStatus?.deviceInfoBase58 ?? 'Unknown'}',
        'Discovered Nodes: ${bleStatus?.discoveredNodes ?? '0'}',
        'Nodes Pending Confirmation: ${bleStatus?.nodesPendingConfirmation ?? '0'}',
      ];
    }, [bleStatus]);

    final refreshConnectionData = useCallback(() {
      ref.read(qaulWorkerProvider).sendBleInfoRequest();
      ref.read(qaulWorkerProvider).getNodeInfo();
    }, []);

    final theme = Theme.of(context).textTheme;
    final l18ns = AppLocalizations.of(context);
    return CronTaskDecorator(
      schedule: const Duration(milliseconds: 1500),
      callback: refreshConnectionData,
      child: ListView(
        padding: MediaQuery.of(context)
            .viewPadding
            .add(const EdgeInsets.fromLTRB(16, 8, 16, 8)),
        children: [
          Row(
            children: [
              QaulAvatar.large(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user != null
                            ? user.name
                            : _notFound(l18ns!, l18ns.username),
                        style: theme.headline6,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        user != null
                            ? user.idBase58
                            : _notFound(l18ns!, l18ns.userID),
                        style: theme.subtitle2,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Text('Qaul ${l18ns!.publicKey}', style: theme.headline5),
          const SizedBox(height: 20),
          Text(
            user != null && user.keyBase58 != null
                ? user.keyBase58!
                : _notFound(l18ns, l18ns.publicKey),
          ),
          const SizedBox(height: 60),
          Text('Bluetooth Connection Status', style: theme.headline5),
          const SizedBox(height: 20),
          if (Platform.isAndroid)
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: bleData.length,
              itemBuilder: (_, i) => Text(bleData[i]),
              separatorBuilder: (_, __) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(),
              ),
            )
          else
            const Text('Currently not supported'),
          const SizedBox(height: 60),
          Text('Node Info', style: theme.headline4),
          const SizedBox(height: 20),
          Text('Node ID', style: theme.headline6),
          const SizedBox(height: 8),
          Text(nodeInfo?.idBase58 ?? 'Unknown', style: theme.bodyText2!.copyWith(fontSize: 12)),
          const SizedBox(height: 20),
          Text('Known Addresses', style: theme.headline6),
          const SizedBox(height: 8),
          Table(
            border: TableBorder.all(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: List.generate(
              nodeInfo?.knownAddresses.length ?? 0,
              (index) => TableRow(
                children: [
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(nodeInfo!.knownAddresses[index]),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _notFound(AppLocalizations localizations, String field) =>
      '$field ${localizations.notFoundErrorMessage}';
}
