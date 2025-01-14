import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ThemeCubit extends Cubit<ThemeMode> {
  static const themeKey = 'theme';
  ThemeCubit() : super(ThemeMode.system) {
    getTheme();
  }
  Future<void> saveTheme(ThemeMode themeMode) async {
    emit(themeMode);
    final pref = await SharedPreferences.getInstance();
    await pref.setInt(themeKey, themeMode.index);
  }

  Future<void> getTheme() async {
    final pref = await SharedPreferences.getInstance();
    final themeMode = pref.getInt(themeKey) ?? ThemeMode.system.index;
    emit(ThemeMode.values[themeMode]);
  }

  Future<void> changeTheme() async {
    final isDarkMode = state == ThemeMode.dark;
    final newTheme = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    emit(newTheme);
    final pref = await SharedPreferences.getInstance();
    await pref.setInt(themeKey, newTheme.index);
  }
}
