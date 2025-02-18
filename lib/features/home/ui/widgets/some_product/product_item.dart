import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/assets_manager.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/widgets/favorite_icon_widget.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({super.key, required this.product});
  final Product product;

  @override
  @override
  Widget build(BuildContext context) {
    //
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: product.mainImage ?? AssetsManager.notFound,
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                    top: 10, right: 10, child: FavoriteIcon(product: product))
              ],
            ),
            vertcalSpace(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        product.title ?? 'No',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$ ${product.price.toString()}',
                        style: const TextStyle(
                            fontSize: 18, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
