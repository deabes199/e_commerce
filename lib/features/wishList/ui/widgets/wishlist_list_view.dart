import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/features/wishList/ui/widgets/wishlist_item.dart';

class WishlistListView extends StatelessWidget {
  const WishlistListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return context.read<FavoritesCubit>().favoriteList.isEmpty
            ? Column(
                children: [
                  vertcalSpace(100),
                  Image.asset('assets/images/aa.jpg')
                ],
              )
            : Expanded(
                child: ListView.builder(
                    itemCount:
                        context.read<FavoritesCubit>().favoriteList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return WishlistItems(
                        product:
                            context.read<FavoritesCubit>().favoriteList[index],
                      );
                    }));
      },
    );
  }
}

