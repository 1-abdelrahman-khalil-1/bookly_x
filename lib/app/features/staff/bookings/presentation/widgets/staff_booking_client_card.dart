import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class StaffBookingClientCard extends StatelessWidget {
  const StaffBookingClientCard({
    super.key,
    required this.name,
    this.phone,
    this.avatarUrl,
    required this.onCallPressed,
  });

  final String name;
  final String? phone;
  final String? avatarUrl;
  final VoidCallback onCallPressed;

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.lightPurple,
            backgroundImage:
                avatarUrl != null ? NetworkImage(avatarUrl!) : null,
            child: avatarUrl == null
                ? Text(
                    name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '',
                    style: context.bold20Primary
                        .copyWith(color: AppColors.textMain),
                  )
                : null,
          ),
          12.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:
                      context.bold16Primary.copyWith(color: AppColors.textMain),
                ),
                if (phone != null) ...[
                  4.h,
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined,
                          size: 14, color: AppColors.textSub),
                      4.w,
                      Text(
                        phone!,
                        style: context.regular14TextSub,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          InkWell(
            onTap: onCallPressed,
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.dodgerBlue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.phone,
                color: AppColors.dodgerBlue,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
