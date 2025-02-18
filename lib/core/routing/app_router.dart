import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/account/ui/screens/profile_details_screen.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:hero_store_app/nav_bar/logic/cubit/nav_bar_cubit.dart';
import 'package:hero_store_app/nav_bar/ui/bottom_nav_bar_screen.dart';
import 'package:hero_store_app/core/di/dependancy_injection.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/features/cart/ui/screens/cart_screen.dart';
import 'package:hero_store_app/features/cart/logic/add_carts_cubit.dart';
import 'package:hero_store_app/features/wishList/logic/cubit/favorites_cubit.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:hero_store_app/features/home/ui/screen/home_screen.dart';
import 'package:hero_store_app/features/login/logic/cubit/login_cubit.dart';
import 'package:hero_store_app/features/login/ui/screen/forgot_password_screen.dart';
import 'package:hero_store_app/features/login/ui/screen/login_screen.dart';
import 'package:hero_store_app/features/product_details/ui/screens/product_details_screen.dart';
import 'package:hero_store_app/features/products/logic/cubit/category_cubit.dart';
import 'package:hero_store_app/features/products/logic/search_cubit/cubit/search_cubit.dart';
import 'package:hero_store_app/features/products/ui/screens/search_screen.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';
import 'package:hero_store_app/features/account/ui/screens/Profile_screen.dart';
import 'package:hero_store_app/features/products/ui/screens/product_screen.dart';
import 'package:hero_store_app/features/account/ui/screens/edit_profile_screen.dart';
import 'package:hero_store_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:hero_store_app/features/signup/ui/screen/signup_screen.dart';
import 'package:hero_store_app/features/wishList/ui/screen/wishlist_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productDetailScreen:
        final product = settings.arguments as Product;

        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => getIt<FavoritesCubit>()),
                    BlocProvider(
                      create: (context) => getIt<HomeCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => AddCartsCubit(),
                    ),
                  ],
                  child: ProductDetailsScreen(
                    product: product,
                  ),
                ));

      case Routes.searchScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<SearchproductCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => AddCartsCubit(),
                    ),
                    BlocProvider(create: (context) => FavoritesCubit()),
                  ],
                  child: const SearchScreen(),
                ));
      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<NavBarCubit>(),
                    ),
                    BlocProvider(create: (context) => getIt<FavoritesCubit>()),
                    BlocProvider(
                      create: (context) => getIt<AddCartsCubit>(),
                    ),
                  ],
                  child: const BottomNavBarScreen(),
                ));
      case Routes.editProfileScreen:
        final user = settings.arguments as SignupResponseModel;

        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<ProfileInfoCubit>(),
                    ),
                  ],
                  child: EditProfileScreen(user: user),
                ));

      case Routes.wishlistScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<FavoritesCubit>()..getFavorite(),
                  child: const WishlistScreen(),
                ));

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const ForgotPasswordScreen(),
                ));

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      case Routes.profileDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<ProfileInfoCubit>()..displayProfileInfo(),
            child: const ProfileDetailsScreen(),
          ),
        );

      default:
        const Scaffold(
          body: Center(
            child: Text('No route'),
          ),
        );
    }
    return null;
  }

  static List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileInfoCubit>()..displayProfileInfo(),
        ),
      ],
      child: const HomeScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CategoryCubit>()..getCategory(),
        ),
      ],
      child: const ProductsScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<AddCartsCubit>()..getCartList(),
      child: const CartScreen(),
    ),
    const ProfileScreen()
  ];
}
