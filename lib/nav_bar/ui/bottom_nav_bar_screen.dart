import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/routing/app_router.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/nav_bar/logic/cubit/nav_bar_cubit.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavBarScreen> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
     context.read<FavoritesCubit>().getFavorite();
      context.read<AddCartsCubit>().getCartList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void changePage(int page) {
    context.read<NavBarCubit>().changePage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          changePage(value);
        },
        controller: pageController,
        children: AppRouter.screens,
      ),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  BottomAppBar _bottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: MediaQuery.of(context).size.height * 0.083,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          singleBottomAppBar(
            context,
            defaultIcon: Icons.home,
            page: 0,
            label: "Home",
            filledIcon: Icons.home_filled,
          ),
          singleBottomAppBar(
            context,
            defaultIcon: Icons.menu_sharp,
            page: 1,
            label: "Category",
            filledIcon: Icons.menu,
          ),
          singleBottomAppBar(
            context,
            defaultIcon: Icons.shopping_cart,
            page: 2,
            label: "Cart",
            filledIcon: Icons.shopping_cart,
          ),
          singleBottomAppBar(
            context,
            defaultIcon: Icons.person,
            page: 3,
            label: "Profile",
            filledIcon: Icons.person,
          ),
        ],
      ),
    );
  }

  singleBottomAppBar(
    BuildContext context, {
    required defaultIcon,
    required filledIcon,
    required label,
    required page,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<NavBarCubit>().changePage(page);
        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 10), curve: Curves.bounceIn);
      },
      child: Column(
        children: [
          Icon(
            context.watch<NavBarCubit>().state == page
                ? filledIcon
                : defaultIcon,
            color: context.watch<NavBarCubit>().state == page
                ? AppColors.primaryColor
                : Colors.grey,
            size: MediaQuery.of(context).size.width * 0.06,
          ),
          vertcalSpace(2),
          Text(
            label,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: context.watch<NavBarCubit>().state == page
                    ? AppColors.primaryColor
                    : Colors.black,
                fontSize: 14),
          )
        ],
      ),
    );
  }
}
