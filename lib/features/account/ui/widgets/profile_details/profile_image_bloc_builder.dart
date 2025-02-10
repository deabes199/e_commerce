import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';
import 'package:hero_store_app/features/account/ui/widgets/profile_details/display_image.dart';

class ProfileImageBlocBuilder extends StatelessWidget {
  const ProfileImageBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
      builder: (context, state) {
        if (state is ProfileInfoSuccess) {
          return DispalyUserImage(
            user: state.newUser,
          );
        } else if (state is UpdateProfileImageFaliure) {
          return const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black,
            child: Text('Not found'),
          );
        } else {
          return const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black,
          );
        }
      },
    );
  }
}
