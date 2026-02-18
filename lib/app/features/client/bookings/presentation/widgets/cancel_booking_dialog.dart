import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class CancelBookingDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CancelBookingDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Warning Icon
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
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
              child: GestureDetector(
                onTap: onCancel,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.textBorders,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    tr.cancel,
                    style: context.regular14Black,
                  ),
                ),
              ),
            ),
            12.w,
            Expanded(
              child: GestureDetector(
                onTap: onConfirm,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.danger,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    tr.cancel,
                    style: context.regular14White,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
