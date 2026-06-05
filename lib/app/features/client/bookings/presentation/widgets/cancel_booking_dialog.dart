import 'package:bookly_x/app/core/extensions/context_extensions.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class CancelBookingDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CancelBookingDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });
  static void showDialog(BuildContext context,
      {required VoidCallback onConfirm, required VoidCallback onCancel}) {
    context.showCustomDialog(
        content: CancelBookingDialog(onConfirm: onConfirm, onCancel: onCancel));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Warning Icon
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            color: AppColors.dangerLight,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            MyIcons.calendarRemoveOutline,
            color: AppColors.danger,
            size: 32,
          ),
        ),
        16.h,
        // Title
        Text(
          tr.cancelBookingTitle,
          style: context.semiBold16Black,
          textAlign: TextAlign.center,
        ),
        12.h,
        // Message
        Text(
          tr.cancelBookingMessage,
          style: context.regular12TextSub,
          textAlign: TextAlign.center,
        ),
        24.h,
        // Buttons
        Row(
          children: [
            Expanded(
              child: CustomButton(
                title: tr.no,
                onPress: onCancel,
                buttonColor: AppColors.textBorders,
                titleColor: AppColors.black,
              ),
            ),
            12.w,
            Expanded(
              child: CustomButton(
                title: tr.yes,
                onPress: onConfirm,
                buttonColor: AppColors.danger,
                titleColor: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
