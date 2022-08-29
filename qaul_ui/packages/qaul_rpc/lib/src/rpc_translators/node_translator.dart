part of 'abstract_rpc_module_translator.dart';

class NodeTranslator extends RpcModuleTranslator {
  @override
  Modules get type => Modules.NODE;

  @override
  Future<RpcTranslatorResponse?> decodeMessageBytes(List<int> data) async {
    final message = Node.fromBuffer(data);
    switch (message.whichMessage()) {
      case Node_Message.info:
        final msg = message.ensureInfo();
        final nodeInfo = NodeInfo(msg.idBase58, msg.addresses);
        return RpcTranslatorResponse(Modules.NODE, nodeInfo);
      default:
        return super.decodeMessageBytes(data);
    }
  }

  @override
  Future<void> processResponse(RpcTranslatorResponse res, Reader reader) async {
    if (res.module != type || res.data is! NodeInfo) return;
    reader(nodeInfoProvider.state).state = res.data;
  }
}
