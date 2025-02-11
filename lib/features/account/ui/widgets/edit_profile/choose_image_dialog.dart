import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/text_style.dart';

void showChooseImageDialog(
    {required BuildContext context,
    required Function() cameraOnTap,
    required Function() galleryOnTap}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title:
                Text('Choose Image From :', style: TextStyles.font20BlackBold),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: cameraOnTap,
                  child: Text(
                    'Camera',
                    style: TextStyles.font18primaryBold,
                  ),
                ),
                vertcalSpace(8),
                InkWell(
                  onTap: galleryOnTap,
                  child: Text(
                    'Gallery',
                    style: TextStyles.font18primaryBold,
                  ),
                ),
              ],
            ),
          ));
}
