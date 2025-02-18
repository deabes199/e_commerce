import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:shimmer/shimmer.dart';

class ExpandedProductGridViewShimmer extends StatelessWidget {
  const ExpandedProductGridViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
              final theme = Theme.of(context);
            return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
              
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: 
                     Shimmer.fromColors(
                        baseColor: theme.cardColor,
                        highlightColor: theme.highlightColor,
                        child: Container(
                          height: 180,
                          width: 180,
                          color: Colors.white,
                        ),
                      )
                  
              ),
            ),
            
          ],
        ),
        vertcalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                     Shimmer.fromColors(
                        baseColor: theme.cardColor,
                        highlightColor: theme.highlightColor,
                        child: Container(
                          height: 16,
                          width: 100,
                          color: Colors.white,
                        ),
                      ),
                 
               Shimmer.fromColors(
                        baseColor: theme.cardColor,
                        highlightColor: theme.highlightColor,
                        child: Container(
                          height: 18,
                          width: 50,
                          color: Colors.white,
                        ),
                      )
                 
              ],
            ),
         
          ],
        ),
      ],
    );
          }),
    );
  }
}


