import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qaul_rpc/qaul_rpc.dart';
import 'package:qaul_ui/decorators/loading_decorator.dart';
import 'package:qaul_ui/widgets/default_back_button.dart';
import 'package:qaul_ui/widgets/language_select_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:utils/utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l18ns = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
        title: Row(
          children: [
            const Icon(Icons.settings),
            const SizedBox(width: 8),
            Text(l18ns.settings),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              MediaQuery.of(context).viewPadding.copyWith(left: 20, right: 20),
          child: Column(
            children: const [
              LanguageSelectDropDown(),
              SizedBox(height: 20),
              _ThemeSelectDropDown(),
              SizedBox(height: 80),
              _InternetNodesList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeSelectDropDown extends StatelessWidget {
  const _ThemeSelectDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l18ns = AppLocalizations.of(context);
    return Row(
      children: [
        const Icon(Icons.palette_outlined),
        const SizedBox(width: 8.0),
        Text(l18ns!.theme),
        const SizedBox(width: 32.0),
        Expanded(
          child: ValueListenableBuilder<AdaptiveThemeMode>(
            valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
            builder: (_, mode, child) {
              var isDark = mode == AdaptiveThemeMode.dark;
              return DropdownButton<bool>(
                isExpanded: true,
                value: !isDark,
                items: [
                  DropdownMenuItem<bool>(
                    value: true,
                    child: Text(l18ns.lightTheme),
                  ),
                  DropdownMenuItem<bool>(
                    value: false,
                    child: Text(l18ns.darkTheme),
                  ),
                ],
                onChanged: (choseLightTheme) {
                  if (choseLightTheme == null) return;
                  choseLightTheme
                      ? AdaptiveTheme.of(context).setLight()
                      : AdaptiveTheme.of(context).setDark();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _InternetNodesList extends HookConsumerWidget {
  const _InternetNodesList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(connectedNodesProvider).state;

    final loading = useState(true);
    final isMounted = useIsMounted();
    useMemoized(() async {
      await RpcConnections(ref.read).requestNodes();

      await Future.delayed(const Duration(seconds: 2));

      if (!isMounted()) return;

      final libqaul = ref.read(libqaulProvider);

      final queued = await libqaul.checkReceiveQueue();
      if (queued > 0) await libqaul.receiveRpc();

      loading.value = false;
    });

    final l18ns = AppLocalizations.of(context);
    return Column(
      children: [
        Row(
          children: [
            const Icon(CupertinoIcons.globe),
            const SizedBox(width: 8.0),
            Text(l18ns!.internetNodes),
          ],
        ),
        const SizedBox(height: 8.0),
        LoadingDecorator(
          isLoading: loading.value,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: loading.value
                      ? BorderSide.none
                      : BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: nodes.length,
              separatorBuilder: (_, __) => const Divider(height: 12.0),
              itemBuilder: (context, i) {
                var nodeAddr = nodes[i].address;
                return ListTile(
                  contentPadding: const EdgeInsets.all(4.0),
                  title: Text(
                    nodeAddr,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  trailing: IconButton(
                    splashRadius: 24,
                    iconSize: 20,
                    icon: const Icon(CupertinoIcons.delete),
                    onPressed: () async {
                      loading.value = true;
                      await RpcConnections(ref.read).removeNode(nodeAddr);

                      await Future.delayed(const Duration(seconds: 2));

                      if (!isMounted()) return;

                      final libqaul = ref.read(libqaulProvider);

                      var queued = await libqaul.checkReceiveQueue();
                      if (queued > 0) await libqaul.receiveRpc();
                      loading.value = false;
                    },
                  ),
                  onTap: () async {
                    final ip =
                        nodeAddr.replaceAll('/ip4/', '').split('/').first;
                    final port = nodeAddr.split('/').last;
                    final res = await showDialog(
                      context: context,
                      builder: (_) => _AddNodeDialog(ip: ip, port: port),
                    );

                    if (res is! String) return;
                    loading.value = true;

                    // remove
                    await RpcConnections(ref.read).removeNode(nodeAddr);

                    await Future.delayed(const Duration(seconds: 2));

                    if (!isMounted()) return;

                    final libqaul = ref.read(libqaulProvider);

                    var queued = await libqaul.checkReceiveQueue();
                    if (queued > 0) await libqaul.receiveRpc();

                    // add updated
                    await RpcConnections(ref.read).addNode(res);

                    await Future.delayed(const Duration(seconds: 2));

                    if (!isMounted()) return;

                    queued = await libqaul.checkReceiveQueue();
                    if (queued > 0) await libqaul.receiveRpc();

                    loading.value = false;
                  },
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              splashRadius: 24,
              onPressed: () async {
                final res = await showDialog(
                    context: context, builder: (_) => _AddNodeDialog());

                if (res is! String) return;
                loading.value = true;

                await RpcConnections(ref.read).addNode(res);

                await Future.delayed(const Duration(seconds: 2));

                if (!isMounted()) return;

                final libqaul = ref.read(libqaulProvider);

                var queued = await libqaul.checkReceiveQueue();
                if (queued > 0) await libqaul.receiveRpc();

                loading.value = false;
              },
            ),
            const SizedBox(width: 12.0),
            Text(l18ns.addNodeCTA),
          ],
        ),
      ],
    );
  }
}

class _AddNodeDialog extends HookWidget {
  _AddNodeDialog({
    Key? key,
    this.ip,
    this.port,
  }) : super(key: key);

  final String? ip;
  final String? port;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ipCtrl = useTextEditingController(text: ip);
    final portCtrl = useTextEditingController(text: port);

    final l18ns = AppLocalizations.of(context)!;
    var orientation = MediaQuery.of(context).orientation;
    final tcpField = [
      _spacer,
      Text('/tcp/', style: _fixedTextStyle),
      _spacer,
      Expanded(
        child: TextFormField(
          controller: portCtrl,
          decoration: _decoration('port', hint: '9229'),
          keyboardType: TextInputType.number,
          validator: (val) {
            if (isValidPort(val)) return null;
            return l18ns.invalidPortMessage;
          },
        ),
      ),
    ];

    return AlertDialog(
      title:
          orientation == Orientation.landscape ? null : Text(l18ns.addNodeCTA),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('/ip4/', style: _fixedTextStyle),
                _spacer,
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    controller: ipCtrl,
                    inputFormatters: [IPv4TextInputFormatter()],
                    decoration: _decoration('ip', hint: '000.000.000.000'),
                    validator: (val) {
                      if (isValidIPv4(val)) return null;
                      return l18ns.invalidIPMessage;
                    },
                    keyboardType: TextInputType.number,
                    enableInteractiveSelection: false,
                  ),
                ),
                if (orientation == Orientation.landscape) ...tcpField,
              ],
            ),
            if (orientation == Orientation.portrait) ...[
              const SizedBox(height: 20),
              Row(children: tcpField),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(l18ns.okDialogButton),
          onPressed: () {
            if (!(_formKey.currentState?.validate() ?? false)) return;
            Navigator.pop(context, '/ip4/${ipCtrl.text}/tcp/${portCtrl.text}');
          },
        ),
        TextButton(
          child: Text(l18ns.cancelDialogButton),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  SizedBox get _spacer => const SizedBox(width: 4, height: 4);

  TextStyle get _fixedTextStyle => TextStyle(
      fontSize: 26, fontWeight: FontWeight.w500, color: Colors.grey.shade500);

  InputDecoration _decoration(String label, {String? hint}) => InputDecoration(
        isDense: true,
        hintText: hint,
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(12),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      );
}
