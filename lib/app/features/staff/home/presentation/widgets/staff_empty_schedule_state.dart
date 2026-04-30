import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffEmptyScheduleState extends StatelessWidget {
  const StaffEmptyScheduleState({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 88),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 124,
                height: 124,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      blurRadius: 30,
                      spreadRadius: 8,
                    ),
                  ],
                ),
                child: const Icon(
                  MyIcons.calendarOutline,
                  color: AppColors.primary,
                  size: 52,
                ),
              ),
              Positioned(
                top: -8,
                right: 12,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: AppColors.warningLight,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.warning.withValues(alpha: 0.18),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Icon(
                    MyIcons.tickCircleOutline,
                    size: 14,
                    color: AppColors.warning,
                  ),
                ),
              ),
              Positioned(
                left: -10,
                bottom: 8,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.lightPurple.withValues(alpha: 0.35),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    MyIcons.clockOutline,
                    size: 14,
                    color: AppColors.primary2,
                  ),
                ),
              ),
            ],
          ),
          28.h,
          Text(
            tr.noAppointmentsToday,
            textAlign: TextAlign.center,
            style: context.bold20Primary,
          ),
          12.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              tr.noAppointmentsDescription,
              textAlign: TextAlign.center,
              style: context.regular14TextSub,
            ),
          ),
        ],
      ),
    );
  }
}
