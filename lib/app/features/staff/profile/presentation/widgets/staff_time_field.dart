import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class StaffTimeField extends StatelessWidget {
  const StaffTimeField({
    super.key,
    required this.value,
    required this.onTap,
    this.dimmed = false,
  });

  final String value;
  final VoidCallback onTap;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: dimmed ? AppColors.textBorders : AppColors.whiteCatskillWhite,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.textPlaceholder),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: dimmed ? context.semiBold14TextSub : context.semiBold14,
              ),
            ),
            const Icon(
              MyIcons.arrowDownOutline,
              size: 16,
              color: AppColors.textSub,
            ),
          ],
        ),
      ),
    );
  }
}
