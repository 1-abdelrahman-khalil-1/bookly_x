import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class ConfirmActionDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmActionDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
  });

  static void showDialog(
    BuildContext context, {
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
    String title = 'Confirm',
    String content = '',
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    context.showCustomDialog(
      content: ConfirmActionDialog(
        title: title,
        content: content,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.semiBold18TextMain,
          textAlign: TextAlign.center,
        ),
        12.h,
        Text(
          content,
          style: context.regular14TextSub,
          textAlign: TextAlign.center,
        ),
        20.h,
        Row(
          children: [
            Expanded(
              child: CustomButton(
                title: cancelText,
                onPress: onCancel,
                buttonColor: AppColors.white,
                borderColor: AppColors.textBorders,
                titleColor: AppColors.textMain,
              ),
            ),
            12.w,
            Expanded(
              child: CustomButton(
                title: confirmText,
                onPress: onConfirm,
                buttonColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
