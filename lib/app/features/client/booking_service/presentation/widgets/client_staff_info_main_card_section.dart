import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ClientStaffInfoMainCardSection extends StatelessWidget {
  const ClientStaffInfoMainCardSection({super.key, required this.staff});

  final StaffModel staff;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.whiteCatskillWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.textBorders),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(staff.name, style: context.semiBold20TextMain),
                      4.h,
                      Text(staff.category, style: context.regular12TextSub),
                    ],
                  ),
                ),
                const Icon(
                  MyIcons.starBold,
                  color: AppColors.warningBadge,
                  size: 14,
                ),
                4.w,
                Text(
                  '${staff.rating.toStringAsFixed(1)} (${staff.reviewCount} ${tr.review})',
                  style: context.regular12TextSub,
                ),
              ],
            ),
            14.h,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.secondaryLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.textBorders),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _ClientStaffInfoStatItem(
                      icon: MyIcons.profile2userOutline,
                      value: '${staff.clientsCount}+',
                      label: tr.client,
                    ),
                  ),
                  Expanded(
                    child: _ClientStaffInfoStatItem(
                      icon: MyIcons.briefcaseOutline,
                      value: '${staff.yearsExperience}+',
                      label: tr.yearsExp,
                    ),
                  ),
                  Expanded(
                    child: _ClientStaffInfoStatItem(
                      icon: MyIcons.starOutline,
                      value: staff.rating.toStringAsFixed(1),
                      label: tr.rating,
                    ),
                  ),
                  Expanded(
                    child: _ClientStaffInfoStatItem(
                      icon: MyIcons.message2Outline,
                      value: '${staff.reviewCount}+',
                      label: tr.reviews,
                    ),
                  ),
                ],
              ),
            ),
            14.h,
            Text(tr.aboutMe, style: context.semiBold22TextMain),
            8.h,
            Text(staff.about, style: context.regular14TextSub),
          ],
        ),
      ),
    );
  }
}

class _ClientStaffInfoStatItem extends StatelessWidget {
  const _ClientStaffInfoStatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.primaryLightHover,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.textBorders),
          ),
          child: Icon(icon, color: AppColors.primary, size: 17),
        ),
        8.h,
        Text(value, style: context.semiBold20TextMain),
        2.h,
        Text(label, style: context.regular12TextSub),
      ],
    );
  }
}
