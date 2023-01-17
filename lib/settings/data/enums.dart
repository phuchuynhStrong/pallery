import 'package:flutter/material.dart';
import 'package:pallery/l10n/l10n.dart';

enum SettingMenu {
  fontsize,
  darkTheme,
  language,
  notification,
}

enum FontSizeSetting {
  small,
  medium,
  large,
}

enum DarkThemeSetting {
  light,
  dark,
  phone,
}

SettingMenu getMenuItemFromString(String key) {
  return SettingMenu.values.firstWhere((element) => element.name == key);
}

extension SettingMenuDisplay on SettingMenu {
  String tr(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      // case SettingMenu.fontsize:
      //   return l10.fontsize;
      // case SettingMenu.darkTheme:
      //   return l10.darkTheme;
      case SettingMenu.language:
        return l10n.language;
      case SettingMenu.notification:
        return l10n.notification;
      default:
        return '';
    }
  }
}
