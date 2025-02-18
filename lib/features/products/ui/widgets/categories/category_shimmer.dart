import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerLoading extends StatelessWidget {
  const CategoryShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var theme = Theme.of(context);
          return Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[300]!
                      : Colors.black,
                  highlightColor: theme.highlightColor,
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.scaffoldBackgroundColor),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
