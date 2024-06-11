import 'package:flutter/material.dart';

import 'theme_manager.dart';

class AppColor {
  // Colors
  static const Color secondaryColorLight = Color(0xFFE2EAF2);

  static const Color primaryColor = Color(primaryColorValue);
  static const Color secondaryColor = Color(0xFF1FE284);
  static const Color backgroundColorDark = const Color(0xFF1E1E1E);
  static const Color appBarColorDark = const Color(0xFF1E1E1E);
  static const Color primarytextColor = Color(0xFF898A8D);
  static const Color secondaryTextColor = Color(0xFF000000);
  static const Color textFieldColor = Color(0xFFF3F3F3);
  static const Color primaryColorDeep = Color(0xFFFF5C00);

  static final Color dividerColorNormal = const Color(0xFF7D7D7D);
  static final Color defaultSplashColor = Colors.grey.shade400;

  static const Color dividerColor = Color(0xFFC5C5C5);

  static final Color splashColor = Colors.grey.shade400;

  static const int primaryColorValue = 0xff111827;

  static const MaterialColor primarySwatch = MaterialColor(
    primaryColorValue,
    <int, Color>{
      50: Color(0xFFD4E1FF),
      100: Color(0xFFB7CCFF),
      200: Color(0xFF92B3FF),
      300: Color(0xFF6E9AFF),
      400: Color(0xFF4A80FF),
      500: Color(primaryColorValue),
      600: Color(0xFF2056D4),
      700: Color(0xFF1945AA),
      800: Color(0xFF133480),
      900: Color(0xFF0D2255),
    },
  );

  ThemeMode _currentMode = ThemeNotifier.defaultThemeMode; // Default

  static const Color inactiveGrey = Color(0xFF3E3E3E);

  static const Color pureRed = Color(0xFFFF0000);

  static const Color red = Color(0xFFE9343F);

  AppColor(ThemeNotifier themeNotifier) {
    _currentMode = themeNotifier.themeMode;
  }

  static const Color gray50 = Color(0XFFFAFAFB);

  Color get textColor => _currentMode == ThemeMode.dark
      ? const Color(0xFFF6F6F6)
      : const Color(0xE51A171B);

  Color? get primaryButtonTextColor =>
      _currentMode == ThemeMode.dark ? const Color(0xFF000000) : null;

  Color? get secondaryButtonTextColor =>
      _currentMode == ThemeMode.dark ? const Color(0xFFFFFFFF) : null;

  Color? get scaffoldBgColor => _currentMode == ThemeMode.dark
      ? backgroundColorDark
      : const Color(0xFFFFFFFF);
}
