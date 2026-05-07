import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class RecentServicesList extends StatelessWidget {
  const RecentServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(tr.recentServices,
                style:
                    context.bold16Primary.copyWith(color: AppColors.textMain)),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Text(
                tr.viewAll,
                style:
                    context.bold14Primary.copyWith(color: AppColors.dodgerBlue),
              ),
            ),
          ],
        ),
        8.h,
        _buildServiceCard(
          context: context,
          initials: 'AJ',
          name: 'Alex Johnson',
          serviceDetails: 'Deep Cleaning • 2h',
          price: '+\$120',
          time: 'Today, 2:00 PM',
          avatarColor: AppColors.lightPurple,
        ),
        12.h,
        _buildServiceCard(
          context: context,
          initials: 'MK',
          name: 'Maria Kim',
          serviceDetails: 'Standard Maint • 1.5h',
          price: '+\$85',
          time: 'Yesterday',
          avatarColor: AppColors.primaryLightActive,
        ),
        12.h,
        _buildServiceCard(
          context: context,
          initials: 'DB',
          name: 'David Brown',
          serviceDetails: 'Consultation • 1h',
          price: '+\$50',
          time: 'Mon, 9:00 AM',
          avatarColor: AppColors.zumthor,
        ),
      ],
    );
  }

  Widget _buildServiceCard({
    required BuildContext context,
    required String initials,
    required String name,
    required String serviceDetails,
    required String price,
    required String time,
    required Color avatarColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textBorders),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: avatarColor,
            child: Text(
              initials,
              style: context.bold14Primary.copyWith(color: AppColors.textMain),
            ),
          ),
          12.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: context.bold14Primary
                        .copyWith(color: AppColors.textMain)),
                4.h,
                Text(serviceDetails, style: context.regular12TextSub),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price,
                  style: context.bold14Primary
                      .copyWith(color: AppColors.textMain)),
              4.h,
              Text(time, style: context.regular12TextSub),
            ],
          ),
        ],
      ),
    );
  }
}
