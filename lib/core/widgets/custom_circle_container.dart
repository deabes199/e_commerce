import 'package:flutter/material.dart';


class CustomCircleContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const CustomCircleContainer({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(25),
        ),
        child: child,
      ),
    );
  }
}

