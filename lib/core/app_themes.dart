import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white
    ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      onPrimary: AppColors.white,
      onSecondary: AppColors.black
    )
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white
    ),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      onPrimary: AppColors.black,
      onSecondary: AppColors.white
    )
  );
}