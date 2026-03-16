import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_upload_image.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientEditProfileScreen extends StatefulWidget {
  const ClientEditProfileScreen({super.key});

  @override
  State<ClientEditProfileScreen> createState() =>
      _ClientEditProfileScreenState();
}

class _ClientEditProfileScreenState extends State<ClientEditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Body Badr');
    _emailController = TextEditingController(text: 'bodybadr@gmail.com');
    _phoneController = TextEditingController(text: '+20 100 000 0000');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: tr.editProfile),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: CustomUploadImage(
                  initImageUrl:
                      'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  isCircular: true,
                  profileSize: 88,
                  iconSize: 14,
                  iconBgColor: AppColors.textBorders,
                ),
              ),
              24.h,
              CustomTextFormField(
                title: tr.fullName,
                hint: tr.enterYourFullName,
                controller: _nameController,
              ),
              16.h,
              CustomTextFormField(
                title: tr.email,
                hint: tr.enterYourEmail,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              16.h,
              CustomTextFormField(
                title: tr.phoneNumber,
                hint: tr.enterYourPhoneNumber,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              48.h,
              CustomButton(
                title: tr.save,
                onPress: () {
                  setSuccessfullyMessage(tr.profileUpdatedSuccessfully);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
