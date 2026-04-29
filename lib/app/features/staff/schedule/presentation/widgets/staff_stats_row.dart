import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffStatsRow extends StatelessWidget {
  const StaffStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _StatCard(
            title: tr.today,
            icon: MyIcons.calendar2Outline,
            value: '4',
            subtitle: tr.bookings,
            valueColor: AppColors.primary,
            gradientColors: [const Color(0xFFEEF5FE), const Color(0xFFDAEAFE)],
            borderColor: const Color(0xFFBDDAFF),
          ),
          12.w,
          _StatCard(
            title: tr.revenue,
            icon: MyIcons.moneyOutline,
            value: r'$1,240',
            subtitle: tr.thisWeek,
            valueColor: AppColors.lightPurple,
            gradientColors: [const Color(0xFFFAF5FE), const Color(0xFFF2E7FE)],
            borderColor: const Color(0xFFBDDAFF),
          ),
          12.w,
          _StatCard(
            title: tr.completed,
            icon: MyIcons.tickCircleOutline,
            value: '12',
            subtitle: tr.thisWeek,
            valueColor: AppColors.success,
            gradientColors: [const Color(0xFFF0FDF4), const Color(0xFFDBFBE6)],
            borderColor: const Color(0xFFBDDAFF),
          ),
          12.w,
          _StatCard(
            title: tr.rating,
            icon: MyIcons.starBold,
            value: '4.9',
            subtitle: tr.average,
            valueColor: AppColors.warning,
            gradientColors: [const Color(0xFFFFF7EC), const Color(0xFFFFECD4)],
            borderColor: const Color(0xFFBDDAFF),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.icon,
    required this.value,
    required this.subtitle,
    required this.valueColor,
    required this.gradientColors,
    required this.borderColor,
  });

  final String title;
  final IconData icon;
  final String value;
  final String subtitle;
  final Color valueColor;
  final List<Color> gradientColors;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.5,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: context.regular14TextSub),
              Icon(icon, size: 16, color: valueColor),
            ],
          ),
          12.h,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: context.bold24.copyWith(color: valueColor),
              ),
              8.w,
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(subtitle, style: context.regular12TextSub),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
