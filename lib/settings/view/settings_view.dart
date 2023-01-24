import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pallery/app/colors.dart';
import 'package:pallery/l10n/l10n.dart';
import 'package:pallery/model/setting/setting.dart';
import 'package:pallery/settings/bloc/settings_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc.initial(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        // ignore: unnecessary_parenthesis
        builder: ((context, state) {
          return SettingsView(state: state);
        }),
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.state});
  final SettingsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final settingsBloc = context.read<SettingsBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
        leading: const BackButton(),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: CustomGradients.cleanMirror),
        child: Column(
          children: [
            Expanded(
              child: SettingsList(
                sections: [
                  SettingsSection(
                    title: Text('Display'),
                    tiles: [
                      SettingsTile(
                        leading: Icon(Icons.language),
                        title: Text('Language'),
                        value: Text('English'),
                        onPressed: (context) {},
                      ),
                      SettingsTile(
                        leading: Icon(Icons.format_size),
                        title: Text('Font size'),
                        value: Text('Small'),
                        onPressed: (context) {},
                      ),
                      SettingsTile.switchTile(
                        leading: Icon(Icons.dark_mode),
                        title: Text('Dark Theme'),
                        initialValue: false,
                        onToggle: (value) {},
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: Text('Common'),
                    tiles: [
                      SettingsTile.switchTile(
                        initialValue: true,
                        onToggle: (val) {},
                        title: Text('Notifications'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingItemView extends StatelessWidget {
  const SettingItemView({
    super.key,
    required this.menu,
    this.value,
    this.readOnly = false,
  });
  final SettingMenu menu;
  final bool readOnly;
  final dynamic value;

  Widget trailing() {
    switch (value.runtimeType) {
      case String:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value.toString()),
            if (!readOnly) const Icon(Icons.chevron_right),
          ],
        );
      case bool:
        return CupertinoSwitch(
          value: value as bool,
          onChanged: (value) {},
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(menu.tr(context)),
      trailing: trailing(),
    );
  }
}
