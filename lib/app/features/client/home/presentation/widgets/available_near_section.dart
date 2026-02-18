import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class AvailableNearSection extends StatelessWidget {
  const AvailableNearSection({super.key});

  final List<Map<String, dynamic>> providers = const [
    {
      'name': 'Ahmed Hassan',
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop',
      'description':
          'Professional spa therapist specialized in\ndeep tissue and relaxation massage.',
      'rating': '4.8',
      'earned': '\$45k+',
      'rate': '\$50/hr',
      'verified': true,
    },
    {
      'name': 'Omar Khalil',
      'image':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400&h=600&fit=crop',
      'description':
          'Expert barber with 10+ years experience in\nmodern cuts and traditional grooming.',
      'rating': '4.9',
      'earned': '\$52k+',
      'rate': '\$45/hr',
      'verified': true,
    },
    {
      'name': 'Dr. Mahmoud Ali',
      'image':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop',
      'description':
          'Board-certified dermatologist offering\npremium skincare and aesthetic treatments.',
      'rating': '5.0',
      'earned': '\$80k+',
      'rate': '\$120/hr',
      'verified': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr.availableNearYou,
                style: context.regular18,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  tr.viewAll,
                  style: context.regular14Primary,
                ),
              ),
            ],
          ),
        ),
        8.h,
        SizedBox(
          height: 360,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: providers.length,
            separatorBuilder: (context, index) => 8.w,
            itemBuilder: (context, index) {
              return ProviderCard(provider: providers[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ProviderCard extends StatelessWidget {
  final Map<String, dynamic> provider;

  const ProviderCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 212,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(provider['image']),
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
                    provider['name'],
                    style: context.regular14White,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (provider['verified'])
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
              provider['description'],
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
                StatItem(
                  icon: Icons.star,
                  value: provider['rating'],
                  label: tr.rating,
                ),
                Container(
                  height: 32,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
                StatItem(
                  value: provider['earned'],
                  label: tr.earned,
                ),
                Container(
                  height: 32,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
                StatItem(
                  value: provider['rate'],
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

class StatItem extends StatelessWidget {
  final IconData? icon;
  final String value;
  final String label;

  const StatItem({
    super.key,
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
