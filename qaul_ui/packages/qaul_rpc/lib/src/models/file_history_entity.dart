import '../generated/services/filesharing/filesharing_rpc.pb.dart';

class FileHistoryEntity {
  FileHistoryEntity({
    required this.id,
    required this.name,
    required this.extension,
    required this.size,
    required this.description,
    required this.time,
    required this.isSent,
    required this.peedId,
  });

  final int id;
  final String name;
  final String extension;
  final int size;
  final String description;
  final DateTime time;
  final bool isSent;
  final String peedId;

  factory FileHistoryEntity.fromRpcEntry(FileHistoryEntry file) {
    return FileHistoryEntity(
      id: file.fileId.toInt(),
      name: file.fileName,
      extension: file.fileExt,
      size: file.fileSize,
      description: file.fileDescr,
      time: DateTime.fromMillisecondsSinceEpoch(file.time.toInt()),
      isSent: file.sent,
      peedId: file.peerId,
    );
  }
}
