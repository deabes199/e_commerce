import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/theming/cubit/theme_cubit.dart';

void changeThemeDialog(BuildContext context, ThemeCubit themeCubit) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.light_mode),
                title: Text('Light'),
                trailing: themeCubit.state == ThemeMode.light
                    ? Icon(Icons.check)
                    : null,
                onTap: () {
                  themeCubit.saveTheme(ThemeMode.light);
                  context.pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('Dark'),
                trailing: themeCubit.state == ThemeMode.dark
                    ? Icon(Icons.dark_mode)
                    : null,
                onTap: () {
                  themeCubit.saveTheme(ThemeMode.dark);
                  context.pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.mode),
                title: Text('System'),
                trailing: themeCubit.state == ThemeMode.system
                    ? Icon(Icons.check)
                    : null,
                onTap: () {
                  themeCubit.saveTheme(ThemeMode.system);
                  context.pop();
                },
              )
            ],
          ),
        );
      });
}
