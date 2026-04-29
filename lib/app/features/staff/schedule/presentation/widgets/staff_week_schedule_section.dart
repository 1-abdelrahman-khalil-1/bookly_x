import 'package:bookly_x_client/app/core/enums/weeks_days_enum.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffWeekScheduleSection extends StatelessWidget {
  const StaffWeekScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.textBorders),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tr.weekSchedule, style: context.medium16Black),
            16.h,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: WeeksDaysEnum.values.map((day) {
                  final isSelected = day == WeeksDaysEnum.monday;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _DayCard(
                      day: day.displayName,
                      date: 'Oct 28',
                      count: '6',
                      isSelected: isSelected,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard({
    required this.day,
    required this.date,
    required this.count,
    required this.isSelected,
  });

  final String day;
  final String date;
  final String count;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.azureRadiance],
              )
            : null,
        color: isSelected ? null : AppColors.catskillWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            day.length > 3 ? day.substring(0, 3) : day,
            style: isSelected ? context.regular12White : context.regular12Black,
          ),
          4.h,
          Text(
            date.contains(' ') ? date.split(' ')[1] : date,
            style: isSelected
                ? context.regular12White
                    .copyWith(color: AppColors.white.withValues(alpha: 0.8))
                : context.regular12TextSub,
          ),
          8.h,
          Text(
            count,
            style: isSelected
                ? context.medium16White
                : context.medium16Black.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
