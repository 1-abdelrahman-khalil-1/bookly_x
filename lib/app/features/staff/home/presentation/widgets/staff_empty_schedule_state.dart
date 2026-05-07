import 'dart:math' as math;

import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffEmptyScheduleState extends StatefulWidget {
  const StaffEmptyScheduleState({super.key});

  @override
  State<StaffEmptyScheduleState> createState() =>
      _StaffEmptyScheduleStateState();
}

class _StaffEmptyScheduleStateState extends State<StaffEmptyScheduleState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 88),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // Outer Glow / Pulse
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.15),
                          AppColors.primary.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                  // Main Icon Container
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
                      Icons.calendar_month_outlined,
                      color: AppColors.primary,
                      size: 52,
                    ),
                  ),
                  // Floating Tick Icon
                  Positioned(
                    top: -8 + 10 * math.sin(_controller.value * 2 * math.pi),
                    right: 12 + 10 * math.cos(_controller.value * 2 * math.pi),
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
                  // Floating Clock Icon
                  Positioned(
                    left: -10 +
                        12 *
                            math.cos(_controller.value * 2 * math.pi + math.pi),
                    bottom: 8 +
                        12 *
                            math.sin(_controller.value * 2 * math.pi + math.pi),
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: AppColors.lightPurple.withValues(alpha: 0.35),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        MyIcons.clockOutline,
                        size: 16,
                        color: AppColors.primary2,
                      ),
                    ),
                  ),
                ],
              );
            },
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
