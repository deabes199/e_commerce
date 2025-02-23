import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.product, this.height, this.width});
  final Product product;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<FavoritesCubit>().addProductInfavorite(product);
      },
      child: Container(
        height: height??50,
        width:width?? 50,
        decoration: BoxDecoration(
          color: AppColors.lighterGray,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          Icons.favorite,
          color: context.read<FavoritesCubit>().productIsFavorite(product)
              ? Colors.red
              : Colors.grey,
        ),
      ),
    );
  }
}
