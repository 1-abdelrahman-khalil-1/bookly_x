import 'package:bookly_x/app/core/enums/weeks_days_enum.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class StaffWeekChip extends StatelessWidget {
  const StaffWeekChip({
    super.key,
    required this.day,
    required this.dayNumber,
    required this.isSelected,
    required this.onTap,
  });

  final WeeksDaysEnum day;
  final String dayNumber;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 58,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.textPlaceholder,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.16),
                    blurRadius: 14,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.shortCode,
              style: isSelected
                  ? context.semiBold14White
                  : context.semiBold14TextSub,
            ),
            4.h,
            Text(
              dayNumber,
              style: isSelected ? context.bold16White : context.bold16,
            ),
          ],
        ),
      ),
    );
  }
}
