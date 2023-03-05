import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pallery/app/logger.dart';
import 'package:pallery/app/routes.dart';
import 'package:pallery/l10n/l10n.dart';
import 'package:pallery/model/setting/setting.dart';
import 'package:pallery/repository/repository.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.value});

  factory SettingsState.initial() {
    return SettingsState(value: initialValue);
  }

  static final initialValue = AppSettings(
    common: const CommonSettingsSectionData(notification: true),
    display: DisplaySettingsSectionData.get(
      language: 'en',
    ),
  );

  final AppSettings value;

  @override
  List<Object?> get props => [value];
}

class SettingEvent {
  SettingEvent(this.action, {this.field, this.value});

  final SettingsBlocAction action;
  final SettingMenu? field;
  final dynamic value;
}

enum SettingsBlocAction {
  update,
  load,
}

class SettingsBloc extends Bloc<SettingEvent, SettingsState> {
  SettingsBloc(
    super.initialState, {
    SettingsRepository? settingRepo,
  }) {
    _repository = settingRepo ??= SettingsRepository();
    _repository.get().then(loadSetting);

    on<SettingEvent>((event, emit) {
      switch (event.action) {
        case SettingsBlocAction.update:
          handleUpdateEvent(event, emit);
          break;
        case SettingsBlocAction.load:
          handleLoadEvent(event, emit);
          break;
      }
    });
  }

  factory SettingsBloc.initial({
    SettingsRepository? settingRepo,
  }) =>
      SettingsBloc(SettingsState.initial(), settingRepo: settingRepo);

  void handleLoadEvent(SettingEvent event, Emitter<SettingsState> emit) {
    if (event.value == null || event.value is! SettingsState) {
      return;
    }

    emit(event.value as SettingsState);
  }

  void handleUpdateEvent(SettingEvent event, Emitter<SettingsState> emit) {
    if (event.field == null || event.value == null) {
      return;
    }

    SettingsState? newState;

    switch (event.field!) {
      case SettingMenu.notification:
        newState = SettingsState(
          value: state.value.copyWith(
            common: CommonSettingsSectionData(
              notification: event.value as bool,
            ),
          ),
        );
        break;
      case SettingMenu.fontsize:
        newState = SettingsState(
          value: state.value.copyWith(
            display: DisplaySettingsSectionData.get(
              fontSize: event.value as FontSizeSetting,
              darkTheme: state.value.display.darkTheme,
              language: state.value.display.language,
            ),
          ),
        );
        break;
      case SettingMenu.language:
        newState = SettingsState(
          value: state.value.copyWith(
            display: DisplaySettingsSectionData.get(
              fontSize: state.value.display.fontsize,
              darkTheme: state.value.display.darkTheme,
              language: event.value.toString(),
            ),
          ),
        );
        break;
      case SettingMenu.darkTheme:
        newState = SettingsState(
          value: state.value.copyWith(
            display: DisplaySettingsSectionData.get(
              fontSize: state.value.display.fontsize,
              darkTheme: event.value == true
                  ? DarkThemeSetting.dark
                  : DarkThemeSetting.light,
              language: state.value.display.language,
            ),
          ),
        );
        break;
    }

    emit(newState);
    _repository.save(newState.value);
  }

  late final SettingsRepository _repository;

  void saveSetting(SettingMenu field, dynamic value) {
    add(SettingEvent(SettingsBlocAction.update, field: field, value: value));
  }

  void loadSetting(AppSettings appSettings) => add(
        SettingEvent(
          SettingsBlocAction.load,
          value: SettingsState(value: appSettings),
        ),
      );

  dynamic getSettingValue(BuildContext context, SettingMenu field) {
    switch (field) {
      case SettingMenu.language:
        return getLanguageSettingDisplay(
          context,
          state.value.display.language!,
        );
      case SettingMenu.fontsize:
        return getFontSizeSettingDisplay(
          context,
          state.value.display.fontsize,
        );
      case SettingMenu.darkTheme:
        return getDarkThemeSettingValue(state.value.display.darkTheme);
      case SettingMenu.notification:
        return state.value.common.notification ?? false;
    }
  }

  bool getDarkThemeSettingValue(DarkThemeSetting setting) {
    return setting == DarkThemeSetting.dark;
  }

  String getFontSizeSettingDisplay(
    BuildContext context,
    FontSizeSetting value,
  ) {
    final l10n = context.l10n;
    switch (value) {
      case FontSizeSetting.small:
        return l10n.fontsizeSmall;
      case FontSizeSetting.medium:
        return l10n.fontsizeMedium;
      case FontSizeSetting.large:
        return l10n.fontsizeLarge;
    }
  }

  String getLanguageSettingDisplay(BuildContext context, String value) {
    final l10n = context.l10n;
    if (value == 'en') {
      return l10n.english;
    }

    return l10n.vietnamese;
  }

  String getSubSettingTitle(BuildContext context, SettingMenu menu) {
    final l10n = context.l10n;
    switch (menu) {
      case SettingMenu.fontsize:
        return l10n.fontsize;
      case SettingMenu.language:
        return l10n.language;
      case SettingMenu.darkTheme:
      case SettingMenu.notification:
        return '';
    }
  }

  void openSubSetting(BuildContext context, SettingMenu menu) {
    context.pushNamed(
      RouteName.selectableSubsetting.value,
      queryParams: {'menu': menu.name},
      extra: this,
    );
  }

  List<dynamic> getSubSettingValues(SettingMenu menu) {
    if (menu == SettingMenu.fontsize) {
      return FontSizeSetting.values;
    }

    if (menu == SettingMenu.language) {
      return <String>['en', 'vi'];
    }

    return [];
  }

  bool isSubSettingSelected(SettingMenu menu, dynamic value) {
    if (menu == SettingMenu.fontsize) {
      return (value as FontSizeSetting) == state.value.display.fontsize;
    }

    if (menu == SettingMenu.language) {
      return value.toString() == state.value.display.language;
    }

    return false;
  }
}
