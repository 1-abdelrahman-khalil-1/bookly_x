import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/staff/main_screen/data/enums/staff_week_day.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_time_field.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffWorkScheduleDayCard extends StatelessWidget {
  const StaffWorkScheduleDayCard({
    super.key,
    required this.day,
    required this.isEnabled,
    required this.onToggle,
    this.dimmed = false,
  });

  final StaffWeekDay day;
  final bool isEnabled;
  final ValueChanged<bool> onToggle;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    final dayStyle =
        dimmed ? context.semiBold16TextSub : context.semiBold16TextMain;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: dimmed ? AppColors.whiteCatskillWhite : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.textBorders),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(day.label(tr), style: dayStyle),
              const Spacer(),
              Switch(
                value: isEnabled,
                onChanged: onToggle,
                activeThumbColor: AppColors.primary,
              ),
            ],
          ),
          8.h,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr.startTime, style: context.regular12TextSub),
                    8.h,
                    StaffTimeField(
                      value: '09:00\nAM',
                      onTap: () {},
                      dimmed: dimmed,
                    ),
                  ],
                ),
              ),
              12.w,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr.endTime, style: context.regular12TextSub),
                    8.h,
                    StaffTimeField(
                      value: '05:00\nPM',
                      onTap: () {},
                      dimmed: dimmed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
