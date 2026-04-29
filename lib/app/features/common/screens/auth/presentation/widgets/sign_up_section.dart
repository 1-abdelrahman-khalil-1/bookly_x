import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/utils/validation_helper.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_phone_number.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/screens/otp_verification_screen.dart';
import 'package:bookly_x_client/generated/assets.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpSection extends StatefulWidget {
  const SignUpSection({super.key, required this.onBackButtonPressed});
  final VoidCallback onBackButtonPressed;
  @override
  State<SignUpSection> createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isAgreedToTerms = false;
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16) +
          EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Column(
          children: [
            CustomTextFormField(
              title: tr.fullName,
              prefixIcon: const Icon(Icons.person_outline),
              controller: _fullNameController,
              validator: (value) => ValidationHelper.validateFullName(value),
            ),
            8.h,
            CustomPhoneNumber(
              controller: _phoneNumberController,
              onCountryChanged: (country) {},
              onChanged: (phone) {},
            ),
            CustomTextFormField(
              title: tr.email,
              prefixIcon: const Icon(Icons.email_outlined),
              controller: _emailController,
              validator: (value) => ValidationHelper.validateEmail(value),
            ),
            CustomPasswordTextFormField(
              title: tr.password,
              controller: _passwordController,
              validator: (value) => ValidationHelper.validatePassword(value),
            ),
            CustomPasswordTextFormField(
              title: tr.confirmPassword,
              controller: _confirmPasswordController,
              validator: (value) => ValidationHelper.validateConfirmPassword(
                value,
                _passwordController.text,
              ),
            ),
            // terms and conditions
            Row(
              children: [
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: _isAgreedToTerms,
                  onChanged: (value) {
                    setState(() {
                      _isAgreedToTerms = value!;
                    });
                  },
                ),
                SizedBox(
                  width: context.width * 0.7,
                  child: Text(
                    tr.byCreatingAnAccountYouAgreeToTheTermsOfUse,
                    style: context.medium14,
                  ),
                ),
              ],
            ),
            24.h,
            CustomButton(
              title: tr.signUp,
              onPress: () {
                if (true || _formKey.currentState!.validate()) {
                  OtpVerificationRoute(
                    verificationType: VerificationType.email,
                    contactInfo: _emailController.text,
                    phoneNumber: _phoneNumberController.text,
                  ).push(context);
                  widget.onBackButtonPressed();
                } else {
                  setState(() {
                    _autoValidateMode = AutovalidateMode.onUserInteraction;
                  });
                }
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
                      tr.signUpWithGoogle,
                      style: context.medium14,
                    ),
                  ],
                ),
              ),
            ),
            16.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr.alreadyHaveAnAccount,
                  style: context.medium14,
                ),
                TextButton(
                  onPressed: widget.onBackButtonPressed,
                  child: Text(
                    tr.login,
                    style: context.medium14.copyWith(
                      color: context.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
