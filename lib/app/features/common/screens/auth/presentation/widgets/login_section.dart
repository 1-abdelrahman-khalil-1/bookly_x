import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x_client/generated/assets.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16) +
          EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Column(
        children: [
          CustomTextFormField(
            title: tr.email,
          ),
          CustomPasswordTextFormField(),
          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value!;
                  });
                },
              ),
              Text(tr.rememberMe, style: context.regular14),
              Spacer(),
              TextButton(
                onPressed: () {
                  ForgetPasswordRoute().push(context);
                },
                child: Text(tr.forgotPassword, style: context.regular14Primary),
              ),
            ],
          ),
          24.h,
          CustomButton(
            title: tr.login,
            buttonColor: AppColors.primary,
            borderColor: AppColors.black.withValues(alpha: 0.12),
            textStyle: context.medium16White,
            onPress: () {
              UserPrefs.isUserStaff
                  ? StaffMainRoute().push(context)
                  : ClientMainRoute().push(context);
              setSuccessfullyMessage(tr.loginSuccessfuly);
            },
          ),
          16.h,
          Text(tr.or, style: context.medium14TextSub),
          16.h,
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.textBorders),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  SvgPicture.asset(
                    Assets.svgGoogle,
                  ),
                  Text(
                    tr.continueWithGoogle,
                    style: context.medium14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
