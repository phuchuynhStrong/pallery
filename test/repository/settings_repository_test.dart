import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pallery/repository/settings_repository.dart';
import 'package:pallery/service/database_service.dart';
import 'package:pallery/settings/data/enums.dart';
import 'package:pallery/settings/data/setting_data.dart';

class MockDbService extends Mock implements IsarDbService {}

void main() {
  group('Settings Repository', () {
    late SettingsRepository settingsRepository;
    late IsarDbService dbService;
    setUp(() async {
      dbService = MockDbService();
      settingsRepository = SettingsRepository(
        service: dbService,
      );

      when(() => dbService.getAppSettings()).thenAnswer((_) => Future.value());
    });

    test('Should return correct default value', () async {
      final setting = await settingsRepository.get();
      expect(setting, isNotNull);
      expect(setting.common?.notification, true);
      expect(setting.display?.language, 'en');
      expect(setting.display?.darkTheme, DarkThemeSetting.dark);
      expect(setting.display?.fontsize, FontSizeSetting.small);
    });

    test('Should return correct value', () async {
      final expected = AppSettings(
        common: CommonSettingsSectionData(notification: false),
        display: DisplaySettingsSectionData(language: 'en'),
      );

      when(() => dbService.getAppSettings())
          .thenAnswer((_) => Future.value(expected));

      final setting = await settingsRepository.get();
      expect(setting, isNotNull);
      expect(setting.common?.notification, false);
      expect(setting.display?.language, 'en');
      expect(setting.display?.darkTheme, DarkThemeSetting.dark);
      expect(setting.display?.fontsize, FontSizeSetting.small);
    });

    test('Should send correct value to service', () async {
      final expected = AppSettings(
        common: CommonSettingsSectionData(notification: false),
        display: DisplaySettingsSectionData(language: 'en'),
      );

      final expected2 = AppSettings(
        common: CommonSettingsSectionData(notification: false),
        display: DisplaySettingsSectionData(language: 'en'),
      );

      when(() => dbService.saveAppSettings(expected))
          .thenAnswer((_) => Future.value());
      when(() => dbService.saveAppSettings(expected2))
          .thenAnswer((_) => Future.value());

      await settingsRepository.save(expected);
      await settingsRepository.save(expected2);
      verify(() => dbService.saveAppSettings(expected)).called(1);
      verify(() => dbService.saveAppSettings(expected2)).called(1);
    });
  });
}
