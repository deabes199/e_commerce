import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/widgets/custom_circle_container.dart';
import 'package:hero_store_app/core/widgets/favorite_icon_widget.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

class ProductImageDetails extends StatelessWidget {
  final Product product;
  final String image;
  const ProductImageDetails({
    super.key,
    required this.product,
    required this.image,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.grey,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(imageUrl: image)),
              ),
              Positioned(
                  top: 30,
                  right: 20,
                  child: FavoriteIcon(
                    product: product,
                  )),
              Positioned(
                  top: 30,
                  left: 20,
                  child: CustomCircleContainer(
                    child: IconButton(
                      onPressed: () {
                        context.pushReplacmentNamed(Routes.bottomNavBarScreen);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
