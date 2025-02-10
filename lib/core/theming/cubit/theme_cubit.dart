import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/core/di/dependancy_injection.dart';
import 'package:hero_store_app/core/helpers/shared_pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const themeKey = 'theme';
  ThemeCubit() : super(ThemeMode.system) {
    getTheme();
  }
  Future<void> saveTheme(ThemeMode themeMode) async {
    emit(themeMode);
    
    await getIt<CacheHelper>().saveData(key: themeKey, value: themeMode.index);
   
  }

  Future<void> getTheme() async {
 
    final themeMode = getIt<CacheHelper>().getData(key:  themeKey) ?? ThemeMode.system.index;
    print("🎨 Saved ThemeMode index: $themeMode");
    emit(ThemeMode.values[themeMode]);
    print(
        "🚀 ThemeMode emitted: ${ThemeMode.values[themeMode]}"); // طباعة الثيم المرسل
  }

  Future<void> changeTheme() async {
    final isDarkMode = state == ThemeMode.dark;
    final newTheme = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    emit(newTheme);
   
     getIt<CacheHelper>().saveData(key:  themeKey,value:  newTheme.index);
  }
}
