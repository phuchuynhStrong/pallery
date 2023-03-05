import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:pallery/model/setting/setting.dart';
import 'package:pallery/service/database_service.dart';

void main() {
  group('Isar Database Service', () {
    late IsarDbService databaseService;

    setUp(() async {
      await Isar.initializeIsarCore(download: true);
      databaseService = IsarDbService.instance();
      await databaseService.init();
      await databaseService.clear();
    });

    tearDown(() {
      databaseService.isar?.close();
    });

    test('Return null if there is no record', () async {
      final res = await databaseService.get<AppSettings>();
      expect(res, null);
    });

    test('Save app settings', () async {
      await databaseService.saveAppSettings(AppSettings.get());
      final res = await databaseService.get<AppSettings>();
      expect(res, isNotNull);
    });
  });
}
