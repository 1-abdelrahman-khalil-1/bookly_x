import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ProviderCard extends StatelessWidget {
  final ProviderModel provider;

  const ProviderCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.5 - 8,
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(provider.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.8),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name with Verification Badge
            Row(
              children: [
                Expanded(
                  child: Text(
                    provider.name,
                    style: context.regular14White,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (provider.verified)
                  Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 18,
                  ),
              ],
            ),
            8.h,
            // Description
            Text(
              provider.description,
              style: context.regular11White.copyWith(
                color: Colors.grey.shade300,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            16.h,
            // Stats Row
            Row(
              children: [
                _StatItem(
                  icon: Icons.star,
                  value: provider.rating,
                  label: tr.rating,
                ),
                Container(
                  height: 32,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
                _StatItem(
                  value: provider.earned,
                  label: tr.earned,
                ),
                Container(
                  height: 32,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
                _StatItem(
                  value: provider.rate,
                  label: tr.rate,
                ),
              ],
            ),
            16.h,
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mail_outline,
                            size: 16, color: AppColors.textMain),
                        8.w,
                        Text(
                          tr.getInTouch,
                          style: context.regular14Black,
                        ),
                      ],
                    ),
                  ),
                ),
                12.w,
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.2)),
                  ),
                  child: Icon(
                    Icons.bookmark_outline,
                    size: 16,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData? icon;
  final String value;
  final String label;

  const _StatItem({
    this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.orange, size: 12),
              4.w,
            ],
            Text(
              value,
              style: context.regular12White,
            ),
          ],
        ),
        Text(
          label,
          style: context.regular11White.copyWith(
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
