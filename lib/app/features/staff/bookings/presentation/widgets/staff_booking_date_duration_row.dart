import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StaffBookingDateDurationRow extends StatelessWidget {
  const StaffBookingDateDurationRow({
    super.key,
    required this.dateTime,
    required this.durationMinutes,
  });

  final DateTime dateTime;
  final int durationMinutes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCard(
            context,
            icon: Icons.calendar_today_outlined,
            title: DateFormat('MMM d, yyyy').format(dateTime),
            subtitle: DateFormat('h:mm a').format(dateTime),
          ),
        ),
        16.w,
        Expanded(
          child: _buildCard(
            context,
            icon: Icons.access_time,
            title: '$durationMinutes mins',
            subtitle: tr.duration,
          ),
        ),
      ],
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.dodgerBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.dodgerBlue,
              size: 20,
            ),
          ),
          12.h,
          Text(
            title,
            style: context.bold14Primary.copyWith(color: AppColors.textMain),
            textAlign: TextAlign.center,
          ),
          4.h,
          Text(
            subtitle,
            style: context.regular12TextSub,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
