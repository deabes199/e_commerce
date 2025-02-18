import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/widgets/custom_tab_bar_widget.dart';
import 'package:hero_store_app/features/account/ui/widgets/edit_profile/edit_bloc_listener.dart';
import 'package:hero_store_app/features/account/ui/widgets/edit_profile/edit_image.dart';
import 'package:hero_store_app/features/account/ui/widgets/edit_profile/edit_text_fields.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:toast/toast.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key, required this.user,
  });
  final SignupResponseModel user;
  

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTabBarWidget(
                  title: 'Edit',
                  widget: IconButton(
                      onPressed: () {
                        context.pushReplacmentNamed(
                          Routes.profileDetailsScreen,
                        );
                      },
                      icon: const Icon(Icons.done)),
                ),
                vertcalSpace(20),
               EditImage(image:user.image ,),
                vertcalSpace(80),
                 EditNameAndPhoneNumber(name: user.name,phone: user.phone,),
                const UpdatedProfileBlocListener(),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
