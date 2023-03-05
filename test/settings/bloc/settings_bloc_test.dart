import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pallery/model/setting/setting.dart';
import 'package:pallery/repository/repository.dart';
import 'package:pallery/service/database_service.dart';
import 'package:pallery/settings/bloc/settings_bloc.dart';

class MockSettingRepo extends Mock implements SettingsRepository {}

void main() {
  group('Settings Bloc', () {
    late IsarDbService databaseService;
    late SettingsRepository settingsRepository;

    setUp(() async {
      await Isar.initializeIsarCore(download: true);
      databaseService = IsarDbService.instance();
      await databaseService.init();
      await databaseService.clear();

      settingsRepository = MockSettingRepo();
    });

    test('initial state shou', () {
      expect(
        SettingsBloc.initial().state.value.toString(),
        equals(SettingsState.initialValue.toString()),
      );
    });

    test('should load state at the very first moment', () async {
      when(() => settingsRepository.get()).thenAnswer(
        (_) async => SettingsState.initialValue.copyWith(
          common: const CommonSettingsSectionData(notification: false),
        ),
      );

      final bloc = SettingsBloc.initial(settingRepo: settingsRepository);
      verify(() => settingsRepository.get()).called(1);

      await Future<void>.delayed(const Duration(milliseconds: 300));
      expect(bloc.state.value.common.notification, false);
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
            display: DisplaySettingsSectionData.get(
              language: 'en',
              fontSize: FontSizeSetting.large,
            ),
          ),
        ),
        SettingsState(
          value: SettingsState.initialValue.copyWith(
            common: const CommonSettingsSectionData(notification: false),
            display: DisplaySettingsSectionData.get(
              language: 'vi',
              fontSize: FontSizeSetting.large,
            ),
          ),
        ),
        SettingsState(
          value: SettingsState.initialValue.copyWith(
            common: const CommonSettingsSectionData(notification: false),
            display: DisplaySettingsSectionData.get(
              language: 'vi',
              darkTheme: DarkThemeSetting.light,
              fontSize: FontSizeSetting.large,
            ),
          ),
        ),
      ],
    );
  });
}
