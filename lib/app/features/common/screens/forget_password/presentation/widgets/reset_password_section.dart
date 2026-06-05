import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ResetPasswordSection extends StatelessWidget {
  const ResetPasswordSection({super.key, required this.goToNextPage});
  final void Function() goToNextPage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr.resetPassword,
                  style: context.bold24Black,
                ),
                8.h,
                Text(
                  tr.enterYourEmailAddressAndWeWillSendYouALinkToResetYourPassword,
                  style: context.regular14TextSub,
                ),
                24.h,
                CustomTextFormField(
                  title: tr.email,
                  hint: tr.enterYourEmail,
                ),
                24.h,
              ],
            )),
          ),
          CustomButton(
            title: tr.sendCode,
            onPress: goToNextPage,
          )
        ],
      ),
    );
  }
}
