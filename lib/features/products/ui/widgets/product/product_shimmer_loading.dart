import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridViewShimmerLoading extends StatelessWidget {
  const ProductGridViewShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Shimmer.fromColors(
                    baseColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey[300]!
                        : Colors.black,
                    highlightColor: Theme.of(context).highlightColor,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
              vertcalSpace(10),
              Row(
                children: [
                  Column(
                    children: [
                      Shimmer.fromColors(
                          baseColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey[300]!
                                  : Colors.black,
                          highlightColor: Theme.of(context).highlightColor,
                          child: Container(
                            height: 25,
                            width: 100,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          )),
                      vertcalSpace(3),
                      Shimmer.fromColors(
                          baseColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey[300]!
                                  : Colors.black,
                          highlightColor: Theme.of(context).highlightColor,
                          child: Container(
                            height: 18,
                            width: 100,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          )),
                    ],
                  )
                ],
              )
            ],
          );
        });
  }
}
