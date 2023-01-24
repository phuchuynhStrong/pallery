import 'package:isar/isar.dart';
import 'package:pallery/model/setting/setting.dart';

abstract class DatabaseService {
  Future<void> init();

  Future<T?> get<T>();
  Future<int> save<T>(T data);
}

class IsarDbService extends DatabaseService {
  Isar? isar;
  @override
  Future<T?> get<T>() async {
    assert(isar != null, 'Must initialize Isar instance before using');
    switch (T) {
      case AppSettings:
        return await isar!.appSettings.get(0) as T?;
      default:
        return null;
    }
  }

  @override
  Future<void> init() async {
    isar = await Isar.open([AppSettingsSchema]);
  }

  Future<AppSettings?> getAppSettings() {
    return get<AppSettings>();
  }

  Future<void> saveAppSettings(AppSettings appSettings) async {
    await save<AppSettings>(appSettings);
  }

  @override
  Future<int> save<T>(T data) async {
    assert(isar != null, 'Must initialize Isar instance before using');

    switch (T) {
      case AppSettings:
        return isar!.writeTxn(
          () => isar!.appSettings.put(
            (data as AppSettings).copyWith(id: 0),
          ),
        );
      default:
        return -1;
    }
  }
}
