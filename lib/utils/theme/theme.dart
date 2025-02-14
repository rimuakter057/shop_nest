
import 'package:flutter/material.dart';
import 'package:shop_nest/utils/theme/custom_theme/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
      primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData()
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
  );
}