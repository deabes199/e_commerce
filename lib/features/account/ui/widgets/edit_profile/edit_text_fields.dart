import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';
import 'package:hero_store_app/core/widgets/app_custom_button.dart';
import 'package:hero_store_app/core/widgets/app_text_form_field.dart';
import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';

import 'name_and_phone_update_method.dart';

class EditNameAndPhoneNumber extends StatelessWidget {
  final String name, phone;

  const EditNameAndPhoneNumber({
    super.key, required this.name, required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    var profileCubit = context.read<ProfileInfoCubit>();
   

    return Form(
        key: profileCubit.updateKey,
        child: Column(
          children: [
            AppTextFormField(
                hintText: name, controller: profileCubit.newName),
            vertcalSpace(25),
            AppTextFormField(
                hintText: phone, controller: profileCubit.newPhone),
            vertcalSpace(30),
            AppCustomButton(
              color: AppColors.primaryColor,
              label: 'Save edit',
              ontap: () async {
                await updateNameAndPhoneMethod(profileCubit);
              },
            )
          ],
        ));
  }
}
