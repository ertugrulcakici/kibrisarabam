import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

part "color_themes.dart";
part "font_themes.dart";
part "padding_margin_themes.dart";

final class CustomThemeData {
  CustomThemeData._();
  static CustomThemeData? _instance;
  static CustomThemeData get instance => _instance ??= CustomThemeData._();

  static CustomFontThemes fontThemes = CustomFontThemes._();
  static CustomColorThemes colorThemes = CustomColorThemes._();
  static CustomPaddingMarginTheme paddingMarginThemes =
      CustomPaddingMarginTheme.instance;

  ThemeData appTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      displayLarge: fontThemes.mPlus1,
      displayMedium: fontThemes.mPlus1,
      displaySmall: fontThemes.mPlus1,
      titleLarge: fontThemes.mPlus1.copyWith(fontSize: 30.sp),
      titleMedium: fontThemes.mPlus1.copyWith(fontSize: 20.sp),
      titleSmall: fontThemes.mPlus1,
      headlineLarge: fontThemes.mPlus1,
      headlineMedium: fontThemes.mPlus1,
      headlineSmall: fontThemes.mPlus1,
      bodyLarge: fontThemes.mPlus1,
      bodyMedium: fontThemes.mPlus1,
      bodySmall: fontThemes.mPlus1,
      labelLarge: fontThemes.mPlus1,
      labelMedium: fontThemes.mPlus1,
      labelSmall: fontThemes.mPlus1,
    ),
  );
}
