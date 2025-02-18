import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:shimmer/shimmer.dart';

class HomeTabBarShimmerLoading extends StatelessWidget {
  const HomeTabBarShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[300]!
              : Colors.black,
          highlightColor: Theme.of(context).highlightColor,
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
          ),
        ),
        horzintalSpace(6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[300]!
                  : Colors.black,
              highlightColor: Theme.of(context).highlightColor,
              child: Container(
                height: 8,
                width: 40,
                color: Colors.white,
              ),
            ),
            vertcalSpace(5),
            Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[300]!
                  : Colors.black,
              highlightColor: Theme.of(context).highlightColor,
              child: Container(
                height: 8,
                width: 80,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
