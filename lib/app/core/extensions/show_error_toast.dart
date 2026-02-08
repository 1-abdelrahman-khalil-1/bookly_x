import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../themes/app_colors.dart';

extension ErrorToast on BuildContext {
  void showErrorToast(
    String message, {
    StyledToastPosition position = StyledToastPosition.bottom,
  }) {
    showToastWidget(
      Container(
        width: 334,
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.danger,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            const Icon(
              MyIcons.closeCircleBold,
              color: AppColors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: AppColors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      context: this,
      duration: const Duration(seconds: 3),
      animation: StyledToastAnimation.slideToBottomFade,
      reverseAnimation: StyledToastAnimation.slideToBottomFade,
      position: position,
    );
  }
}
