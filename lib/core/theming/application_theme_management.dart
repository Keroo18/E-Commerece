import 'package:e_commerce/core/theming/color_palette.dart';
import 'package:flutter/material.dart';

class ApplicationThemeManagement{
  static ThemeData ThemeMode=ThemeData(
    textTheme:TextTheme(
      titleLarge:TextStyle(
        color: ColorPalette.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      titleMedium:TextStyle(
        color: ColorPalette.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      bodyLarge:TextStyle(
      color: ColorPalette.primaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
      bodyMedium:TextStyle(
      color: ColorPalette.primaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
    ),
  );
}