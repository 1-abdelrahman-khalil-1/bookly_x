import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/app/features/client/provider_details/data/models/review_model.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

/// Section header + horizontally scrollable review cards.
class ProviderReviewsSection extends StatelessWidget {
  const ProviderReviewsSection({
    super.key,
    required this.reviews,
    required this.totalCount,
    this.onSeeAll,
  });

  final List<ReviewModel> reviews;
  final int totalCount;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${tr.review} ($totalCount)', style: context.semiBold16Black),
            GestureDetector(
              onTap: onSeeAll ?? () {},
              child: Text(tr.seeAll, style: context.regular14TextSub),
            ),
          ],
        ),
        12.h,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: reviews
                .map((r) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _ReviewCard(review: r),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 243,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textBorders),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer row
          Row(
            children: [
              ClipOval(
                child: CustomCachedNetworkImage(
                  imgUrl: review.avatarUrl,
                  width: 30,
                  height: 30,
                ),
              ),
              8.w,
              Expanded(
                child:
                    Text(review.reviewerName, style: context.semiBold14Black),
              ),
              // Star + rating
              const Icon(Icons.star_rounded, color: AppColors.primaryLight, size: 14),
              2.w,
              Text(review.rating.toString(), style: context.bold14Black),
            ],
          ),
          8.h,
          Text(
            review.comment,
            style: context.regular12TextSub,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
