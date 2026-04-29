import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/widgets/auth_form.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/logo_name.dart';
import 'package:bookly_x_client/app/features/common/screens/forget_password/presentation/widgets/otp_confirmation_section.dart';
import 'package:bookly_x_client/app/features/common/screens/forget_password/presentation/widgets/reset_password_section.dart';
import 'package:bookly_x_client/app/features/common/screens/forget_password/presentation/widgets/set_new_password_section.dart';
import 'package:bookly_x_client/generated/assets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
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

  void goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
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
            // Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: LogoName(),
            ),
            24.h,
            // Auth Form
            AuthForm(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      //physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ResetPasswordSection(goToNextPage: goToNextPage),
                        OtpConfirmationSection(goToNextPage: goToNextPage),
                        const SetNewPasswordSection(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
