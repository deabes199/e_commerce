import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/add_to_cart_button.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/reviews_list_view.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/product_description.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/product_image.dart';
import 'package:hero_store_app/features/product_details/ui/widgets/product_title_and_price.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesCubit>().getFavorite();
      context.read<AddCartsCubit>().getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageDetails(
                product: widget.product,
                image: widget.product.mainImage ?? '',
              ),
              vertcalSpace(20),
              ProductTitleAndPrice(
                product: widget.product,
              ),
              vertcalSpace(10),
              AddToCartButton(
                product: widget.product,
              ),
              vertcalSpace(20),
              ProductDecription(
                description: widget.product.description ?? '',
              ),
              vertcalSpace(20),
              ReviewsProduct(
                product: widget.product,
              )
            ],
          ),
        ),
      ),
    );
  }
}
