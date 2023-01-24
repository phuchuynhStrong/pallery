import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:pallery/model/setting/enums.dart';

part 'setting_data.g.dart';

@Collection(inheritance: false)
@CopyWith()
class AppSettings extends Equatable {
  const AppSettings({
    this.id,
    this.common,
    this.display,
  });
  final Id? id;

  final CommonSettingsSectionData? common;
  final DisplaySettingsSectionData? display;

  @ignore
  @override
  List<Object?> get props => [id, common, display];
}

@Embedded(inheritance: false)
class CommonSettingsSectionData extends Equatable {
  const CommonSettingsSectionData({this.notification});
  final bool? notification;

  @ignore
  @override
  List<Object?> get props => [notification];
}

@Embedded(inheritance: false)
class DisplaySettingsSectionData extends Equatable {
  DisplaySettingsSectionData({
    this.language,
    FontSizeSetting? fontSize,
    DarkThemeSetting? theme,
  }) {
    fontsize = fontSize ?? FontSizeSetting.small;
    darkTheme = theme ?? DarkThemeSetting.dark;
  }
  final String? language;
  @enumerated
  late final FontSizeSetting fontsize;
  @enumerated
  late final DarkThemeSetting darkTheme;

  @ignore
  @override
  List<Object?> get props => [language, fontsize, darkTheme];
}
