import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffAppointmentCard extends StatelessWidget {
  const StaffAppointmentCard({
    super.key,
    required this.name,
    required this.service,
    required this.time,
    required this.duration,
    required this.imageUrl,
    this.note,
  });

  final String name;
  final String service;
  final String time;
  final String duration;
  final String imageUrl;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.textBorders),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedNetworkImage(
                  imgUrl: imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              16.w,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: context.bold16Black),
                    4.h,
                    Text(service, style: context.regular14TextSub),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.successLight,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tr.confirmed,
                  style: context.regular12Success,
                ),
              ),
            ],
          ),
          16.h,
          const Divider(color: AppColors.textBorders, height: 1),
          16.h,
          Row(
            children: [
              const Icon(MyIcons.clockLinear,
                  size: 16, color: AppColors.primary),
              8.w,
              Text('$time ($duration)', style: context.medium14Black),
            ],
          ),
          if (note != null) ...[
            12.h,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.warningBadge.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.warningBadge),
              ),
              child: Row(
                children: [
                  const Icon(MyIcons.noteOutline,
                      size: 14, color: AppColors.warning),
                  8.w,
                  Expanded(
                    child: Text(
                      '${tr.note}: $note',
                      style: context.regular12TextSub,
                    ),
                  ),
                ],
              ),
            ),
          ],
          16.h,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPress: () {},
                  title: tr.viewDetails,
                  buttonColor: AppColors.white,
                  borderColor: AppColors.primary,
                  height: 40,
                  textStyle: context.medium14Primary,
                ),
              ),
              12.w,
              Expanded(
                child: CustomButton(
                  onPress: () {},
                  title: tr.startService,
                  buttonColor: AppColors.primary,
                  height: 40,
                  textStyle: context.medium14White,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
