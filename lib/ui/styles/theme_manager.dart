import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/services/local_storage_service.dart';
import 'color.dart';
import 'dimension.dart';
import 'texts.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData get darkTheme => ThemeData(
        primarySwatch: AppColor.primarySwatch,
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: AppColor.backgroundColorDark,
        fontFamily: TextStyles.fontFamily,
        colorScheme: const ColorScheme.dark(
          primary: AppColor.primarySwatch,
          secondary: AppColor.secondaryColor,
          background: AppColor.backgroundColorDark,
          onPrimary: Colors.white,
          // accentColor: MColor.secondarySwatch,
        ),
        dividerColor: AppColor.dividerColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFE5E5E5),
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          color: AppColor.appBarColorDark,
          titleTextStyle: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        textTheme: textStyles.textTheme,
        useMaterial3: true,
      );

  ThemeData get lightTheme => ThemeData(
        primarySwatch: AppColor.primarySwatch,
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: TextStyles.fontFamily,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          primarySwatch: AppColor.primarySwatch,
          accentColor: AppColor.secondaryColor,
          brightness: Brightness.light,
        ),
        dividerColor: AppColor.dividerColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColor.primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
              color: Color(0xFF1B1C1E),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        textTheme: textStyles.textTheme,
        useMaterial3: true,
      );

  ThemeData _themeData = ThemeData();

  ThemeData getTheme() => _themeData;
  // _themeMode == ThemeMode.light ? lightTheme : darkTheme;

  ThemeMode _themeMode = defaultThemeMode;

  ThemeMode get themeMode => _themeMode;

  TextStyles get textStyles => TextStyles(this);
  AppColor get colors => AppColor(this);
  Dimen get dimens => Dimen(this);

  static const ThemeMode defaultThemeMode = ThemeMode.system;

  ThemeNotifier() {
    LocalStorage().readValue('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? defaultThemeMode.name;
      if (themeMode == 'dark') {
        setDarkMode();
      } else {
        setLightMode();
      }
      notifyListeners();
    });
  }

  bool get isInLightMode => _themeMode == ThemeMode.light;

  void setDarkMode() async {
    _themeData = darkTheme;
    _themeMode = ThemeMode.dark;
    notifyListeners();
    LocalStorage().storeValue('themeMode', ThemeMode.dark.name);
  }

  void setLightMode() async {
    _themeData = lightTheme;
    _themeMode = ThemeMode.light;
    notifyListeners();
    LocalStorage().storeValue('themeMode', ThemeMode.light.name);
  }

  void setSystemMode() async {
    _themeMode = ThemeMode.system;
    // _themeData = lightTheme;
    notifyListeners();
    LocalStorage().storeValue('themeMode', ThemeMode.system.name);
  }

  void switchMode() async {
    isInLightMode ? setDarkMode() : setLightMode();
  }
}

extension Conv on ThemeMode {
  String string() {
    return toString().split('.').last;
  }
}

extension Con on String {
  ThemeMode toEnum() {
    for (ThemeMode type in ThemeMode.values) {
      if (type.string() == this) return type;
    }
    return ThemeMode.light;
  }
}
