import 'package:flutter/material.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.iconData,
      required this.title,
      required this.onTap});
  final IconData iconData;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            iconData,
            size: 30,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
          ),
          onTap: onTap,
        ),
        const Divider(
          thickness: 1,
          color: AppColors.lighterGray,
        )
      ],
    );
  }
}
