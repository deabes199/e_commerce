import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';

class WishlistItems extends StatelessWidget {
  final Product product;
  const WishlistItems({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: Container(
            width: double.infinity,
            height: 110.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.mainImage??'',
                    fit: BoxFit.cover,
                    width: 115.w,
                    height: 115.h,
                  ),
                ),
                horzintalSpace(10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(product.title??'',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyles.font18BlackBold
                                    .copyWith(fontSize: 16.sp)),
                          ),
                          horzintalSpace(10),
                          InkWell(
                              onTap: () {
                                context
                                    .read<FavoritesCubit>()
                                    .deleteItem(product);
                              },
                              child:const Icon(
                                Icons.close,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      vertcalSpace(7),
                      Text(
                        product.category??'',
                        style: TextStyles.font16GrayNormal,
                      ),
                      vertcalSpace(7),
                      Text(
                        '\$ ${product.price}',
                        style: TextStyles.font18primaryBold,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
