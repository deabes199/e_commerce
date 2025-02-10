import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/signup/logic/cubit/signup_cubit.dart';

class AddImageSignUp extends StatelessWidget {
  const AddImageSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        File? selectedImage;
        if (state is PickImageSuccess) {
          selectedImage = state.image;
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
                image: selectedImage != null
                    ? DecorationImage(
                        image: FileImage(selectedImage),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: AssetImage('assets/images/user.jpg'),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: IconButton(
                  onPressed: () => context.read<SignupCubit>().pickImage(),
                  icon: const Icon(Icons.camera_alt),
                  color: Colors.blue,
                  iconSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
