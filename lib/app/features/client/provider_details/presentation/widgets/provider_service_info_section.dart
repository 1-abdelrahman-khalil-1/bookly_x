import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';

/// Service name, rating chip, category tag.
class ProviderServiceInfoSection extends StatelessWidget {
  const ProviderServiceInfoSection({
    super.key,
    required this.serviceName,
    required this.rating,
    required this.reviewCount,
  });

  final String serviceName;
  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(serviceName, style: context.bold20Black)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star_rounded,
                  color: AppColors.primaryLight, size: 16),
              4.w,
              Text(
                '$rating($reviewCount)',
                style: context.regular14TextSub,
              ),
            ],
          ),
        )
      ],
    );
  }
}
