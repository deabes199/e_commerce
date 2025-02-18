import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';
import 'package:hero_store_app/features/products/ui/widgets/search/search_product_bloc_builder.dart';
import 'package:hero_store_app/features/products/ui/widgets/search_text_form_field.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
   void initState() {
    super.initState();
    context.read<FavoritesCubit>().getFavorite();
     context.read<AddCartsCubit>().getCartList();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
            const  SearchTextFormField(),
              vertcalSpace(20),
             const SearchProductBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}

