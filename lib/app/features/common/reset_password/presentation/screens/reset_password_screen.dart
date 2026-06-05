import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/utils/show_message.dart';
import 'package:bookly_x/app/core/widgets/auth_form.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/logo_name.dart';
import 'package:bookly_x/app/features/common/reset_password/presentation/widgets/common_otp_confirmation_section.dart';
import 'package:bookly_x/app/features/common/reset_password/presentation/widgets/common_reset_password_section.dart';
import 'package:bookly_x/app/features/common/reset_password/presentation/widgets/common_set_new_password_section.dart';
import 'package:bookly_x/generated/assets.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  late PageController _pageController;
  String _email = '';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onEmailSet(String email) {
    setState(() => _email = email);
  }

  void _onPasswordReset() {
    setSuccessfullyMessage(tr.passwordUpdatedSuccessfully);
    context.router.pushAndPopUntil(
      const AuthRoute(),
      predicate: (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: MediaQuery.of(context).padding.copyWith(bottom: 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.pngBackGround),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: LogoName(),
            ),
            24.h,
            AuthForm(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CommonResetPasswordSection(
                          goToNextPage: _goToNextPage,
                          onEmailSet: _onEmailSet,
                        ),
                        CommonOtpConfirmationSection(
                          goToNextPage: _goToNextPage,
                          email: _email,
                        ),
                        CommonSetNewPasswordSection(
                          onPasswordReset: _onPasswordReset,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
