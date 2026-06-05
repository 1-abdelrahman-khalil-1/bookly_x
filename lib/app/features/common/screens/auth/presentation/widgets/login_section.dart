import 'package:bookly_x/app/core/data/user_pref.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/utils/show_message.dart';
import 'package:bookly_x/app/core/utils/validation_helper.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x/app/features/common/screens/auth/presentation/controllers/auth_notifier.dart';
import 'package:bookly_x/generated/assets.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class LoginSection extends ConsumerStatefulWidget {
  const LoginSection({super.key});

  @override
  ConsumerState<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends ConsumerState<LoginSection> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(
    text: kDebugMode
        ? (UserPrefs.isUserStaff
            ? "mazen.tamer@booklyx.com"
            : "abdo.khalil@booklyx.com")
        : null,
  );
  final _passwordController = TextEditingController(
    text: kDebugMode ? "12345678" : null,
  );
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authNotifierProvider);
    ref.listen(authNotifierProvider, (previous, next) {
      if (!next.isLoading && next.errorMessage == null) {
        UserPrefs.isUserStaff
            ? const StaffMainRoute().push(context)
            : const ClientMainRoute().push(context);
        setSuccessfullyMessage(tr.loginSuccessfuly);
      }
    });
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16) +
          EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Column(
          children: [
            CustomTextFormField(
              title: tr.email,
              controller: _emailController,
              validator: (val) => ValidationHelper.validateEmail(val),
            ),
            CustomTextFormField(
              title: tr.password,
              isPassword: true,
              controller: _passwordController,
              validator: (val) {
                if ((val?.isEmpty ?? false)) {
                  return tr.passwordRequired;
                }
                return null;
              },
            ),
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
                const Spacer(),
                TextButton(
                  onPressed: () {
                    const ResetPasswordRoute().push(context);
                  },
                  child:
                      Text(tr.forgotPassword, style: context.regular14Primary),
                ),
              ],
            ),
            24.h,
            CustomButton(
              title: tr.login,
              isLoading: state.isLoading,
              buttonColor: AppColors.primary,
              borderColor: AppColors.black.withValues(alpha: 0.12),
              textStyle: context.medium16White,
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  ref.read(authNotifierProvider.notifier).login(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                } else {
                  setState(() {
                    _autoValidateMode = AutovalidateMode.always;
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
                      tr.continueWithGoogle,
                      style: context.medium14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
