import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/features/staff/main_screen/data/enums/staff_week_day.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffWeekLabelChip extends StatelessWidget {
  const StaffWeekLabelChip({
    super.key,
    required this.day,
    required this.isSelected,
  });

  final StaffWeekDay day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.textBorders,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        day.label(tr).toUpperCase(),
        style: isSelected ? context.semiBold14White : context.semiBold14TextSub,
      ),
    );
  }
}
