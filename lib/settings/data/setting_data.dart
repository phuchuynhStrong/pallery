import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:pallery/settings/data/enums.dart';

part 'setting_data.g.dart';

@collection
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

  @override
  List<Object?> get props => [id, common, display];
}

@embedded
class CommonSettingsSectionData extends Equatable {
  const CommonSettingsSectionData({this.notification});
  final bool? notification;

  @override
  List<Object?> get props => [notification];
}

@embedded
class DisplaySettingsSectionData extends Equatable {
  DisplaySettingsSectionData({
    this.language,
    FontSizeSetting? fontsize,
    DarkThemeSetting? darkTheme,
  }) {
    this.fontsize = fontsize ?? FontSizeSetting.small;
    this.darkTheme = darkTheme ?? DarkThemeSetting.dark;
  }
  final String? language;
  @enumerated
  late final FontSizeSetting fontsize;
  @enumerated
  late final DarkThemeSetting darkTheme;

  @override
  List<Object?> get props => [language, fontsize, darkTheme];
}
