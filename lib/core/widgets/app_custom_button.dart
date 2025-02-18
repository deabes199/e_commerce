import 'package:flutter/material.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton(
      {super.key,
      required this.label,
      this.ontap,
      this.height = 60,
      this.width = double.infinity,
      this.color = Colors.white});
  final String label;
  final void Function()? ontap;
  final double? height, width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: ontap,
          child: Text(label,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 16, color: Colors.white)),
        ));
  }
}
