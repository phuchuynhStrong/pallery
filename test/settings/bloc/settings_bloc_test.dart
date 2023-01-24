import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pallery/model/setting/setting.dart';
import 'package:pallery/settings/bloc/settings_bloc.dart';

void main() {
  group('Settings Bloc', () {
    test('initial state shou', () {
      expect(
        SettingsBloc.initial().state.value.toString(),
        equals(SettingsState.initialValue.toString()),
      );
    });

    blocTest<SettingsBloc, SettingsState>(
      'state should change after saving',
      build: SettingsBloc.initial,
      act: (bloc) => bloc
        ..saveSetting(SettingMenu.notification, false)
        ..saveSetting(SettingMenu.fontsize, FontSizeSetting.large)
        ..saveSetting(SettingMenu.language, 'vi')
        ..saveSetting(SettingMenu.darkTheme, DarkThemeSetting.light),
      expect: () => [
        SettingsState(
          value: SettingsState.initialValue.copyWith(
            common: const CommonSettingsSectionData(notification: false),
          ),
        ),
        SettingsState(
          value: SettingsState.initialValue.copyWith(
            common: const CommonSettingsSectionData(notification: false),
            display: DisplaySettingsSectionData(
              language: 'en',
              fontSize: FontSizeSetting.large,
            ),
          ),
        ),
        SettingsState(
          value: SettingsState.initialValue.copyWith(
            common: const CommonSettingsSectionData(notification: false),
            display: DisplaySettingsSectionData(
              language: 'vi',
              fontSize: FontSizeSetting.large,
            ),
          ),
        ),
        SettingsState(
          value: SettingsState.initialValue.copyWith(
            common: const CommonSettingsSectionData(notification: false),
            display: DisplaySettingsSectionData(
              language: 'vi',
              theme: DarkThemeSetting.light,
              fontSize: FontSizeSetting.large,
            ),
          ),
        ),
      ],
    );
  });
}
