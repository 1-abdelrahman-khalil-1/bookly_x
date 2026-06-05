import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/utils/show_message.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

enum VerificationType {
  email,
  phone;

  bool get isEmail => this == VerificationType.email;
}

@RoutePage()
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
    required this.verificationType,
    required this.contactInfo,
    this.phoneNumber,
  });

  final VerificationType verificationType;
  final String contactInfo;
  final String? phoneNumber;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController otpController =
      TextEditingController(text: kDebugMode ? '123456' : '');
  int remainingTime = 10;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(16) +
            EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              tr.enter6DigitCode,
              style: context.bold18Black,
            ),
            8.h,

            // Description with highlighted contact info
            RichText(
              text: TextSpan(
                style: context.regular14TextSub,
                children: [
                  TextSpan(
                    text: widget.verificationType == VerificationType.email
                        ? tr.weSentVerificationCodeToYourEmail
                        : tr.weSentVerificationCodeToYourPhone,
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: widget.contactInfo,
                    style: context.regular14.primary,
                  ),
                ],
              ),
            ),
            24.h,

            // OTP Input Fields
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: otpController,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: AppColors.white,
                inactiveFillColor: AppColors.white,
                selectedFillColor: AppColors.white,
                activeColor: AppColors.textSub,
                inactiveColor: AppColors.textSub,
                selectedColor: AppColors.primary,
                borderWidth: 1,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onCompleted: (value) {},
              onChanged: (value) {},
            ),
            24.h,

            // Verify Code Button
            CustomButton(
              title: tr.verifyCode,
              onPress: () {
                if (otpController.text.length == 6) {
                  _handleVerification();
                } else {
                  setWarningMessage(tr.pleaseEnterValidOtp);
                }
              },
            ),
            16.h,

            // Resend code section
            Center(
              child: _buildResendSection(),
            ),
          ],
        ),
      ),
    );
  }

  void _handleVerification() {
    // TODO: Add actual API verification logic here

    if (widget.verificationType.isEmail) {
      // After email verification, go to phone verification
      context.replaceRoute(OtpVerificationRoute(
        verificationType: VerificationType.phone,
        contactInfo: widget.phoneNumber ?? '',
      ));
    } else {
      context.router.pop();
      setSuccessfullyMessage(tr.accountCreatedSuccessfully);
    }
  }

  void _handleResend() {
    // TODO: Add actual resend API logic here
    setState(() {
      remainingTime = 10;
    });
    _startTimer();
  }

  Widget _buildResendSection() {
    if (remainingTime > 0) {
      // Show countdown timer
      return Text(
        '${tr.resendCodeIn} $remainingTime ${tr.seconds}',
        style: context.regular14TextSub,
      );
    } else {
      // Show resend button after countdown finishes
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tr.haventGotTheCodeYet,
            style: context.regular14TextSub,
          ),
          4.w,
          GestureDetector(
            onTap: _handleResend,
            child: Text(
              tr.resendCode,
              style: context.regular14.primary.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      );
    }
  }
}
