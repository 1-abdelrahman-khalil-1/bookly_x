import 'dart:async';

import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpConfirmationSection extends StatefulWidget {
  const OtpConfirmationSection({super.key, required this.goToNextPage});
  final void Function() goToNextPage;
  @override
  State<OtpConfirmationSection> createState() => _OtpConfirmationSectionState();
}

class _OtpConfirmationSectionState extends State<OtpConfirmationSection> {
  Timer? _timer;
  int _start = 60;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

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
                  Text(tr.checkYouEmail, style: context.bold20Black),
                  8.h,
                  Text(
                      tr.weSentAResetLinkToEmailEnter6DigitCodeThatMentionedInTheEmail(
                          email: "alpha...@gmail.com"),
                      style: context.regular16TextSub),
                  16.h,
                  PinCodeTextField(
                    length: 6,
                    controller: kDebugMode
                        ? TextEditingController(text: '123456')
                        : null,
                    autoFocus: true,
                    enableActiveFill: true,
                    cursorColor: AppColors.primary,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    textStyle: context.regular18Black,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(4),
                      borderWidth: 1,
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: AppColors.white,
                      activeColor: AppColors.primary,
                      inactiveColor: AppColors.textSub,
                      inactiveFillColor: AppColors.white,
                      selectedColor: AppColors.primary,
                      selectedFillColor: AppColors.azureRadiance10,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    onCompleted: (otp) {},
                    appContext: context,
                    onChanged: (String value) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(tr.didNotReceiveTheCode,
                          style: context.regular16TextSub),
                      4.w,
                      TextButton(
                          onPressed: () {},
                          child: Text(tr.resendCode,
                              style: context.regular16Primary))
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            title: tr.verifyCode,
            onPress: widget.goToNextPage,
          ),
        ],
      ),
    );
  }
}
