import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/staff/main_screen/data/enums/staff_week_day.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_same_for_all_days_section.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_work_schedule_day_card.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_work_schedule_segmented_control.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffWorkScheduleBottomSheet extends StatefulWidget {
  const StaffWorkScheduleBottomSheet({super.key});

  static void showBottomSheet(BuildContext context) {
    context.showBottomSheet(
      bottomSheetBody: const StaffWorkScheduleBottomSheet(),
      backgroundColor: AppColors.white,
    );
  }

  @override
  State<StaffWorkScheduleBottomSheet> createState() =>
      _StaffWorkScheduleBottomSheetState();
}

class _StaffWorkScheduleBottomSheetState
    extends State<StaffWorkScheduleBottomSheet> {
  bool isSameForAllDays = true;
  bool tuesdayEnabled = true;
  bool wednesdayEnabled = true;
  bool saturdayEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const SizedBox(width: 24),
              const Spacer(),
              Text(tr.editWorkSchedule, style: context.semiBold18Primary),
              const Spacer(),
              GestureDetector(
                onTap: context.pop,
                child: const Icon(
                  MyIcons.closeCircleOutline,
                  color: AppColors.textSub,
                  size: 24,
                ),
              ),
            ],
          ),
          18.h,
          StaffWorkScheduleSegmentedControl(
            leftLabel: tr.sameForAllDays,
            rightLabel: tr.individualDays,
            isLeftSelected: isSameForAllDays,
            onLeftTap: () => setState(() => isSameForAllDays = true),
            onRightTap: () => setState(() => isSameForAllDays = false),
          ),
          18.h,
          if (isSameForAllDays)
            StaffSameForAllDaysSection(
              onStartTap: () {},
              onEndTap: () {},
            )
          else
            Column(
              children: [
                StaffWorkScheduleDayCard(
                  day: StaffWeekDay.tuesday,
                  isEnabled: tuesdayEnabled,
                  onToggle: (value) => setState(() => tuesdayEnabled = value),
                ),
                14.h,
                StaffWorkScheduleDayCard(
                  day: StaffWeekDay.wednesday,
                  isEnabled: wednesdayEnabled,
                  onToggle: (value) => setState(() => wednesdayEnabled = value),
                ),
                14.h,
                StaffWorkScheduleDayCard(
                  day: StaffWeekDay.saturday,
                  isEnabled: saturdayEnabled,
                  dimmed: true,
                  onToggle: (value) => setState(() => saturdayEnabled = value),
                ),
              ],
            ),
          22.h,
          const Divider(height: 1, color: AppColors.textBorders),
          16.h,
          CustomButton(
            title: tr.saveChanges,
            prefixIcon: MyIcons.save2Outline,
            prefixIconSize: 18,
            buttonColor: AppColors.primary,
            titleColor: AppColors.white,
            onPress: () {},
          ),
          10.h,
          CustomButtonOutlined(
            title: tr.cancel,
            buttonColor: AppColors.textBorders,
            titleColor: AppColors.primary2,
            borderColor: AppColors.textBorders,
            onPress: context.pop,
          ),
        ],
      ),
    );
  }
}
