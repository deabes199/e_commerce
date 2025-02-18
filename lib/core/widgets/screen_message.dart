import 'package:flutter/material.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';

class ScreenMessage extends StatelessWidget {
  const ScreenMessage({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: AppColors.primaryColor, fontWeight: FontWeight.bold));
  }
}
