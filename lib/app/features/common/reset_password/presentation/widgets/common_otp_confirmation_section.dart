import 'dart:async';

import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/common/reset_password/presentation/controllers/reset_password_notifier.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CommonOtpConfirmationSection extends ConsumerStatefulWidget {
  const CommonOtpConfirmationSection(
      {super.key, required this.goToNextPage, required this.email});
  final VoidCallback goToNextPage;
  final String email;

  @override
  ConsumerState<CommonOtpConfirmationSection> createState() =>
      _CommonOtpConfirmationSectionState();
}

class _CommonOtpConfirmationSectionState
    extends ConsumerState<CommonOtpConfirmationSection> {
  Timer? _timer;
  int _start = 60;
  String _otp = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() => _start = 60);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() => _start--);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resetPasswordNotifierProvider);
    final notifier = ref.read(resetPasswordNotifierProvider.notifier);

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
                      email: widget.email,
                    ),
                    style: context.regular16TextSub,
                  ),
                  16.h,
                  PinCodeTextField(
                    length: 6,
                    controller: kDebugMode
                        ? TextEditingController(text: '333333')
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
                    appContext: context,
                    onChanged: (value) {
                      _otp = value;
                      notifier.setOtp(value);
                    },
                    onCompleted: (otp) {
                      _otp = otp;
                      notifier.setOtp(otp);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(tr.didNotReceiveTheCode,
                          style: context.regular16TextSub),
                      4.w,
                      TextButton(
                        onPressed: _start == 0
                            ? () {
                                _startTimer();
                                notifier.requestPasswordReset();
                              }
                            : null,
                        child: Text(
                          _start == 0
                              ? tr.resendCode
                              : '${tr.resendCode} (${_start}s)',
                          style: context.regular16Primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            title: tr.verifyCode,
            isLoading: state.isLoading,
            onPress: () async {
              if (_otp.length < 6) return;
              final success = await notifier.verifyPasswordReset();
              if (success && mounted) {
                widget.goToNextPage();
              }
            },
          ),
        ],
      ),
    );
  }
}
