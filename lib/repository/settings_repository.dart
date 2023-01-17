import 'package:pallery/service/database_service.dart';
import 'package:pallery/settings/data/setting_data.dart';

class SettingsRepository {
  factory SettingsRepository({IsarDbService? service}) {
    if (service != null) {
      _instance._dbService = service;
    }
    return _instance;
  }
  SettingsRepository._internal();

  IsarDbService? _dbService;

  IsarDbService get dbService => _dbService ??= IsarDbService();

  static final SettingsRepository _instance = SettingsRepository._internal();

  Future<void> save(AppSettings settings) =>
      dbService.saveAppSettings(settings);

  Future<AppSettings> get() {
    return dbService.getAppSettings().then((value) {
      if (value == null) {
        return AppSettings(
          common: CommonSettingsSectionData(notification: true),
          display: DisplaySettingsSectionData(language: 'en'),
        );
      }
      return value;
    });
  }
}
