import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/assets_manager.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';

class DispalyUserImage extends StatelessWidget {
  const DispalyUserImage({super.key, required this.user});
  final SignupResponseModel user;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: user.image,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 60,
        backgroundImage: imageProvider,
      ),
      errorWidget: (context, url, error) =>
          Image.asset(AssetsManager.defaultUser),
    );
  }
}
