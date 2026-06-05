import 'package:bookly_x/app/core/enums/weeks_days_enum.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/custom_time_picker_field.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffSameForAllDaysSection extends StatefulWidget {
  const StaffSameForAllDaysSection({
    super.key,
    required this.days,
  });

  final List<WeeksDaysEnum> days;

  @override
  State<StaffSameForAllDaysSection> createState() =>
      _StaffSameForAllDaysSectionState();
}

class _StaffSameForAllDaysSectionState
    extends State<StaffSameForAllDaysSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.whiteCatskillWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // days
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(WeeksDaysEnum.values.length, (index) {
                final day = WeeksDaysEnum.values[index];
                return ChoiceChip(
                  label: Text(
                    day.shortCode,
                    style: widget.days.contains(day)
                        ? context.regular14White
                        : context.regular14,
                  ),
                  selected: widget.days.contains(day),
                  backgroundColor: widget.days.contains(day)
                      ? AppColors.primary
                      : AppColors.textBorders,
                  onSelected: (value) {
                    setState(() {
                      if (value) {
                        widget.days.add(day);
                      } else {
                        widget.days.remove(day);
                      }
                    });
                  },
                );
              }),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTimePickerField(
                  title: tr.startTime,
                  initialTime: const TimeOfDay(hour: 9, minute: 0),
                  onTimeSelected: (time) {},
                ),
              ),
              12.w,
              const Icon(MyIcons.arrowRightOutline, color: AppColors.textSub),
              12.w,
              Expanded(
                child: CustomTimePickerField(
                  title: tr.endTime,
                  initialTime: const TimeOfDay(hour: 10, minute: 12),
                  onTimeSelected: (time) {},
                ),
              ),
            ],
          ),
          12.h,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  MyIcons.tickCircleOutline,
                  color: AppColors.primary2,
                  size: 16,
                ),
                8.w,
                Expanded(
                  child: Text(
                    tr.scheduleAppliesToDays(
                      days: widget.days.length,
                    ),
                    style: context.regular14TextSub,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
