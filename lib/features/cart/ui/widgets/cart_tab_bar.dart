import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/theming/text_style.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';

class CartTabBar extends StatelessWidget {
  const CartTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCartsCubit, AddCartsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Carts ',
              style: TextStyles.font20BlackBold.copyWith(fontSize: 24),
            ),
            context.read<AddCartsCubit>().cartList.isEmpty
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: () {
                      context.read<AddCartsCubit>().clearAllProductFromCart();
                    },
                    child: Text(
                      'Clear All',
                      style: TextStyles.font16GrayNormal.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
