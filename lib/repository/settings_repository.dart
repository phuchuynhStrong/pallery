import 'package:pallery/model/setting/setting.dart';
import 'package:pallery/service/database_service.dart';

class SettingsRepository {
  factory SettingsRepository({IsarDbService? service}) {
    if (service != null) {
      _instance._dbService = service;
    }
    return _instance;
  }
  SettingsRepository._internal();

  IsarDbService? _dbService;

  IsarDbService get dbService => _dbService ??= IsarDbService.instance();

  static final SettingsRepository _instance = SettingsRepository._internal();

  Future<void> save(AppSettings settings) =>
      dbService.saveAppSettings(settings);

  Future<AppSettings> get() {
    return dbService.getAppSettings().then((value) {
      if (value == null) {
        return AppSettings(
          common: const CommonSettingsSectionData(notification: true),
          display: DisplaySettingsSectionData.get(language: 'en'),
        );
      }
      return value;
    });
  }
}
