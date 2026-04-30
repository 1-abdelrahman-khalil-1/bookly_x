import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/staff/main_screen/data/enums/staff_week_day.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffWeekChip extends StatelessWidget {
  const StaffWeekChip({
    super.key,
    required this.day,
    required this.dayNumber,
    required this.isSelected,
  });

  final StaffWeekDay day;
  final String dayNumber;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            day.label(tr),
            style: isSelected ? context.semiBold14White : context.semiBold14TextSub,
          ),
          4.h,
          Text(
            dayNumber,
            style: isSelected ? context.bold16White : context.bold16,
          ),
        ],
      ),
    );
  }
}
