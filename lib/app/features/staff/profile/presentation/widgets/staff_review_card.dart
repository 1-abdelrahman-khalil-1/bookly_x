import 'package:bookly_x/app/core/extensions/date_time_exensions.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/staff/profile/data/model/staff_review_model.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class StaffReviewCard extends StatelessWidget {
  const StaffReviewCard({
    super.key,
    required this.review,
  });

  final StaffReviewModel review;

  @override
  Widget build(BuildContext context) {
    final createdAt = review.createdAt;
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.textBorders),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  review.reviewer.name.isNotEmpty == true
                      ? review.reviewer.name
                      : '-',
                  style: context.semiBold16,
                ),
              ),
              const Icon(
                MyIcons.starBold,
                color: AppColors.warningBadge,
                size: 18,
              ),
              4.w,
              Text(
                review.rating.toStringAsFixed(1),
                style: context.semiBold14Primary,
              ),
            ],
          ),
          8.h,
          if (review.comment.isNotEmpty) ...[
            Text(review.comment, style: context.regular14TextSub),
            12.h,
          ],
          Row(
            children: [
              Text(review.service.name, style: context.semiBold12),
              const Spacer(),
              Text(
                createdAt == null
                    ? '-'
                    : '${createdAt.formattedDate} ${createdAt.formattedTime}',
                style: context.regular12TextSub,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
