import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x/app/features/common/reset_password/presentation/controllers/reset_password_notifier.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonResetPasswordSection extends ConsumerStatefulWidget {
  const CommonResetPasswordSection(
      {super.key, required this.goToNextPage, required this.onEmailSet});
  final VoidCallback goToNextPage;
  final void Function(String email) onEmailSet;

  @override
  ConsumerState<CommonResetPasswordSection> createState() =>
      _CommonResetPasswordSectionState();
}

class _CommonResetPasswordSectionState
    extends ConsumerState<CommonResetPasswordSection> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resetPasswordNotifierProvider);

    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return tr.thisFieldIsRequired;
                        }
                        return null;
                      },
                    ),
                    24.h,
                  ],
                ),
              ),
            ),
            CustomButton(
              title: tr.sendCode,
              isLoading: state.isLoading,
              onPress: () async {
                if (!_formKey.currentState!.validate()) return;
                final email = _emailController.text.trim();
                ref
                    .read(resetPasswordNotifierProvider.notifier)
                    .setEmail(email);
                widget.onEmailSet(email);
                final success = await ref
                    .read(resetPasswordNotifierProvider.notifier)
                    .requestPasswordReset();
                if (success && mounted) {
                  widget.goToNextPage();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
