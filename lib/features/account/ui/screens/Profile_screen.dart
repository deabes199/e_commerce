import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/cubit/theme_cubit.dart';
import 'package:hero_store_app/core/theming/theme_dialog.dart';
import 'package:hero_store_app/features/account/ui/widgets/custom_listtile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, });
  

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomListTile(
                  iconData: Icons.person,
                  title: 'Profile Details',
                  onTap: () {
                    Navigator.pushNamed(context, Routes.profileDetailsScreen);
                  },
                ),
                CustomListTile(
                  iconData: Icons.favorite,
                  title: 'WishList',
                  onTap: () {
                    Navigator.pushNamed(context, Routes.wishlistScreen);
                  },
                ),
                
                CustomListTile(
                  iconData: Icons.mode_night,
                  title: 'Change Theme',
                  onTap: () {
                    changeThemeDialog(context, themeCubit);
                  },
                ),
                CustomListTile(
                  iconData: Icons.logout,
                  title: 'SignOut',
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    context.pushNamed(Routes.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
