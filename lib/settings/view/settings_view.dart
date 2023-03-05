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

  SettingsTile getTile(BuildContext context, SettingMenu menu) {
    final settingsBloc = context.watch<SettingsBloc>();
    Widget leading;
    Widget value;
    final Widget title = Text(menu.tr(context));
    switch (menu) {
      case SettingMenu.language:
        leading = const Icon(Icons.language);
        value = Text(settingsBloc.getSettingValue(context, menu).toString());
        break;
      case SettingMenu.fontsize:
        leading = const Icon(Icons.format_size);
        value = Text(settingsBloc.getSettingValue(context, menu).toString());
        break;
      case SettingMenu.darkTheme:
        return SettingsTile.switchTile(
          initialValue: settingsBloc.getSettingValue(context, menu) == true,
          onToggle: (val) => settingsBloc.saveSetting(menu, val),
          title: title,
        );
      case SettingMenu.notification:
        return SettingsTile.switchTile(
          initialValue: settingsBloc.getSettingValue(context, menu) == true,
          onToggle: (val) => settingsBloc.saveSetting(menu, val),
          title: title,
        );
    }

    return SettingsTile(
      title: title,
      leading: leading,
      value: value,
      onPressed: (context) => settingsBloc.openSubSetting(context, menu),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

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
                    title: Text(l10n.display),
                    tiles: [
                      getTile(context, SettingMenu.language),
                      getTile(context, SettingMenu.fontsize),
                      getTile(context, SettingMenu.darkTheme),
                    ],
                  ),
                  SettingsSection(
                    title: Text(l10n.common),
                    tiles: [
                      getTile(context, SettingMenu.notification),
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

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: Text(menu.tr(context)),
    );
  }
}
