import 'package:flutter/material.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget(
      {super.key, required this.title, required this.widget, this.onPressed});
  final String title;
  final Widget widget;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        widget,
      ],
    );
  }
}
