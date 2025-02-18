import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';
import 'package:hero_store_app/features/account/ui/widgets/edit_profile/choose_image_dialog.dart';
import 'package:image_picker/image_picker.dart';

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
                            image: CachedNetworkImageProvider(
                              state.imageUrl,
                            ),
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
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () async {
                    final cubit = context.read<ProfileInfoCubit>();
                    showChooseImageDialog(
                      context: context,
                      cameraOnTap: () async {
                        await cubit.pickImage(ImageSource.camera);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      galleryOnTap: () async {
                        await cubit.pickImage(ImageSource.gallery);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                    );
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
