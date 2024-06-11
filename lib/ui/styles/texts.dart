import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';
import 'theme_manager.dart';

final String _fontFamily =
    GoogleFonts.roboto().fontFamily ?? "Helvetica, Arial, sans-serif";
final String fontFamily2 =
    GoogleFonts.poppins().fontFamily ?? "Helvetica, Arial, serif";

final TextStyle _displayLarge = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w800,
  fontSize: 24,
  height: 36 / 24,
);

final TextStyle _displayMedium = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

/// Slightly bold but larger
final TextStyle _displaySmall = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w500,
  fontSize: 24,
);

/// Slightly bold... Use for toolbars.
final TextStyle _headlineMedium = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 16,
  height: 24 / 16,
);

final TextStyle _headlineSmall = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w500,
  fontSize: 16,
);

final TextStyle _titleLarge = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 24,
  height: 20 / 20,
  color: const Color(0xff111827)
);

final TextStyle _titleMedium = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 16,
  height: 21 / 14,
);

final TextStyle _titleSmall = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 14,
);

final TextStyle _bodyLarge = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);

final TextStyle _bodyMedium = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  height: 18 / 16,
);

final TextStyle _bodySmall = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: const Color(0xff6B7280)

);

final TextStyle _labelLarge = TextStyle(
  fontFamily: _fontFamily,
  fontWeight: FontWeight.w800,
  fontSize: 16,
  height: 24 / 16,
);

class TextStyles {
  static String fontFamily = _fontFamily;

  ThemeMode currentMode = ThemeNotifier.defaultThemeMode;
  late AppColor colors;

  TextStyles(ThemeNotifier themeNotifier) {
    currentMode = themeNotifier.themeMode;
    colors = themeNotifier.colors;
  }

  TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
      );

  TextStyle get displayLarge => _displayLarge.copyWith(
        color: colors.textColor,
      );
  TextStyle get displayMedium => _displayMedium.copyWith(
        color: colors.textColor,
      );
  TextStyle get displaySmall => _displaySmall.copyWith(
        color: colors.textColor,
      );
  TextStyle get headlineMedium => _headlineMedium.copyWith(
        color: colors.textColor,
      );
  TextStyle get headlineSmall => _headlineSmall.copyWith(
        color: colors.textColor,
      );
  TextStyle get titleLarge => _titleLarge.copyWith(
        color: colors.textColor,
      );
  TextStyle get titleMedium => _titleMedium.copyWith(
        color: colors.textColor,
      );
  TextStyle get titleSmall => _titleSmall.copyWith(
        color: colors.textColor,
      );
  TextStyle get bodyLarge => _bodyLarge.copyWith(
        color: colors.textColor,
      );
  TextStyle get bodyMedium => _bodyMedium.copyWith(
        color: colors.textColor,
      );
  TextStyle get bodySmall => _bodySmall.copyWith(
        color: colors.textColor,
      );
  TextStyle get labelLarge => _labelLarge.copyWith(
        color: colors.textColor,
      );
}
