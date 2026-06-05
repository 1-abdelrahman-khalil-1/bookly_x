import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class StaffWorkScheduleSegmentedControl extends StatelessWidget {
  const StaffWorkScheduleSegmentedControl({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    required this.isLeftSelected,
    required this.onLeftTap,
    required this.onRightTap,
  });

  final String leftLabel;
  final String rightLabel;
  final bool isLeftSelected;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.whiteCatskillWhite,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onLeftTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isLeftSelected ? AppColors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isLeftSelected
                      ? [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.04),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  leftLabel,
                  style: isLeftSelected
                      ? context.semiBold14Primary
                      : context.semiBold14TextSub,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onRightTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isLeftSelected ? Colors.transparent : AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: !isLeftSelected
                      ? [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.04),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  rightLabel,
                  style: !isLeftSelected
                      ? context.semiBold14Primary
                      : context.semiBold14TextSub,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
