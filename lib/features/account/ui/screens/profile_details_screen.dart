import 'package:flutter/material.dart';
import 'package:hero_store_app/core/helpers/extentions.dart';
import 'package:hero_store_app/core/helpers/spacing.dart';
import 'package:hero_store_app/features/account/ui/widgets/profile_details/profile_image_bloc_builder.dart';
import 'package:hero_store_app/features/account/ui/widgets/profile_details/username_and_email_bloc_builder.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Spacer(),
                  const Center(
                    child: Text(
                      'Profile Details',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer()
                ],
              ),
              vertcalSpace(20),
              const ProfileImageBlocBuilder(),
              vertcalSpace(40),
              const UsernameAndEmailBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
