import 'package:flutter/material.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';

class ProductWidgetText extends StatelessWidget {
  const ProductWidgetText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.lightGray
              : AppColors.primaryColor,
        ),
        child: Text(
          'All Products',
          style:
              Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 18),
        ));
  }
}
