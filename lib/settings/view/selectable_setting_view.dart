import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pallery/model/setting/enums.dart';
import 'package:pallery/settings/bloc/settings_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SelectableSettingArgument {
  SelectableSettingArgument(this.menu, this.state, this.bloc);

  final SettingMenu menu;
  final SettingsState state;
  final SettingsBloc bloc;
}

class SelectableSettingView extends StatelessWidget {
  const SelectableSettingView({
    super.key,
    required this.menu,
    required this.bloc,
  });
  final SettingMenu menu;
  final SettingsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return SelectableSettingViewContent(
            menu: menu,
            state: state,
          );
        },
      ),
    );
  }
}

class SelectableSettingViewContent extends StatelessWidget {
  const SelectableSettingViewContent({
    super.key,
    required this.menu,
    required this.state,
  });
  final SettingMenu menu;
  final SettingsState state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();
    final title = bloc.getSubSettingTitle(context, menu);
    final values = bloc.getSubSettingValues(menu);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SettingsList(
              sections: [
                if (menu == SettingMenu.fontsize)
                  SettingsSection(
                    tiles: (values as List<FontSizeSetting>)
                        .map(
                          (e) => SettingsTile(
                            onPressed: (_) => bloc.saveSetting(menu, e),
                            title: Text(
                              bloc.getFontSizeSettingDisplay(context, e),
                            ),
                            trailing: bloc.isSubSettingSelected(menu, e)
                                ? Icon(
                                    Icons.check,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : null,
                          ),
                        )
                        .toList(),
                  ),
                if (menu == SettingMenu.language)
                  SettingsSection(
                    tiles: (values as List<String>)
                        .map(
                          (e) => SettingsTile(
                            onPressed: (_) => bloc.saveSetting(menu, e),
                            title: Text(
                              bloc.getLanguageSettingDisplay(context, e),
                            ),
                            trailing: bloc.isSubSettingSelected(menu, e)
                                ? Icon(
                                    Icons.check,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : null,
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
