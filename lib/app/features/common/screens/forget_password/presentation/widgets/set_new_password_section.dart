import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class SetNewPasswordSection extends StatelessWidget {
  const SetNewPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16) +
          EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tr.setNewPassword, style: context.bold20Black),
                  8.h,
                  Text(
                      tr.yourIdentityHasBeenSuccessfullyVerifiedPleaseEnterANewPasswordToSecureYourAccount,
                      style: context.regular16TextSub),
                  24.h,
                  CustomTextFormField(
                    title: tr.newPassword,
                  ),
                  16.h,
                  CustomTextFormField(
                    title: tr.confirmPassword,
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            title: tr.updatePassword,
            onPress: () {
              context.router.pop();
              setSuccessfullyMessage(tr.passwordUpdatedSuccessfully);
            },
          ),
        ],
      ),
    );
  }
}
