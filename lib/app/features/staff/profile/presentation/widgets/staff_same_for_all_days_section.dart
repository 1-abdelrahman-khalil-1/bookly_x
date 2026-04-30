import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_time_field.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffSameForAllDaysSection extends StatelessWidget {
  const StaffSameForAllDaysSection({
    super.key,
    required this.onStartTap,
    required this.onEndTap,
  });

  final VoidCallback onStartTap;
  final VoidCallback onEndTap;

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
                      onTap: onStartTap,
                    ),
                  ],
                ),
              ),
              12.w,
              const Icon(MyIcons.arrowRightOutline, color: AppColors.textSub),
              12.w,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr.endTime, style: context.regular12TextSub),
                    8.h,
                    StaffTimeField(
                      value: '06:00\nPM',
                      onTap: onEndTap,
                    ),
                  ],
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
                    tr.scheduleAppliesToFiveDays,
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
