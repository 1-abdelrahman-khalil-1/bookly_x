import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x_client/app/features/common/reset_password/presentation/controllers/reset_password_notifier.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonSetNewPasswordSection extends ConsumerStatefulWidget {
  const CommonSetNewPasswordSection({super.key, required this.onPasswordReset});
  final VoidCallback onPasswordReset;

  @override
  ConsumerState<CommonSetNewPasswordSection> createState() =>
      _CommonSetNewPasswordSectionState();
}

class _CommonSetNewPasswordSectionState
    extends ConsumerState<CommonSetNewPasswordSection> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resetPasswordNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(16) +
          EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      child: Form(
        key: _formKey,
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
                      style: context.regular16TextSub,
                    ),
                    24.h,
                    CustomTextFormField(
                      title: tr.newPassword,
                      controller: _newPasswordController,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return tr.thisFieldIsRequired;
                        }
                        if (value.length < 8) {
                          return tr.passwordMustBeAtLeast8Characters;
                        }
                        return null;
                      },
                    ),
                    16.h,
                    CustomTextFormField(
                      title: tr.confirmPassword,
                      controller: _confirmPasswordController,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return tr.thisFieldIsRequired;
                        }
                        if (value != _newPasswordController.text) {
                          return tr.passwordsDoNotMatch;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              title: tr.updatePassword,
              isLoading: state.isLoading,
              onPress: () async {
                if (!_formKey.currentState!.validate()) return;
                final success = await ref
                    .read(resetPasswordNotifierProvider.notifier)
                    .resetPassword(
                        newPassword: _newPasswordController.text.trim());
                if (success && mounted) {
                  widget.onPasswordReset();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
