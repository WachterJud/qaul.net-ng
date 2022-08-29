part of 'abstract_rpc_module_translator.dart';

class DebugTranslator extends RpcModuleTranslator {
  @override
  Modules get type => Modules.DEBUG;

  @override
  Future<RpcTranslatorResponse?> decodeMessageBytes(List<int> data) async {
    final message = Debug.fromBuffer(data);
    switch (message.whichMessage()) {
      case Debug_Message.heartbeatResponse:
        message.ensureHeartbeatResponse();
        return RpcTranslatorResponse(Modules.DEBUG, true);
      case Debug_Message.storagePathResponse:
        final response = message.ensureStoragePathResponse();
        return RpcTranslatorResponse(Modules.DEBUG, response.storagePath);
      default:
        return super.decodeMessageBytes(data);
    }
  }

  @override
  Future<void> processResponse(RpcTranslatorResponse res, Reader reader) async {
    // handled within libqaul worker
  }
}
