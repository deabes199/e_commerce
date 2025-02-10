import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';

class EditImage extends StatelessWidget {
  const EditImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
                image: state is PickImageSuccess && state.image != null
                    ? DecorationImage(
                        image: FileImage(state.image!),
                        fit: BoxFit.cover,
                      )
                    : state is UpdateProfileImageSuccessfully
                        ? DecorationImage(
                            image: NetworkImage(state.imageUrl),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          ),
              ),
            ),
            if (state is UploadProfileImageLoading)
              const CircularProgressIndicator(),
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
                  onPressed: () async {
                    final cubit = context.read<ProfileInfoCubit>();
                    await cubit.pickImage();
                    if (cubit.image != null) {
                      await cubit.updateUserImage();
                    }
                  },
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
