import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';

ThemeData getDarkThemeMode() {
  return ThemeData(
    highlightColor: Colors.grey[100]!,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.black12,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: AppColors.primaryColor,
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.sp,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
      ),
    ),
    //
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black,
      hintStyle: TextStyle(fontSize: 16.sp, color: Colors.white),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(24.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(24.r)),
    ),
  );
}

ThemeData getThemeMode() {
  return ThemeData(
    highlightColor: Colors.grey[100]!,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.black)),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: Colors.black,
      filled: true,
      fillColor: AppColors.lighterGray,
      hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(24.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(24.r)),
    ),
  );
}
