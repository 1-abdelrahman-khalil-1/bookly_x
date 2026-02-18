import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class PromoCardsSection extends StatelessWidget {
  const PromoCardsSection({super.key});

  final List<Map<String, String>> promos = const [
    {
      'image':
          'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&h=400&fit=crop',
      'discount': '40%',
      'buttonColor': '0E7BF8',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?w=800&h=400&fit=crop',
      'discount': '40%',
      'buttonColor': 'D45C00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 204,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: promos.length,
        separatorBuilder: (context, index) => 24.w,
        itemBuilder: (context, index) {
          final promo = promos[index];
          return PromoCard(
            imageUrl: promo['image']!,
            discount: promo['discount']!,
            buttonColor: Color(int.parse('0xFF${promo['buttonColor']}')),
          );
        },
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String imageUrl;
  final String discount;
  final Color buttonColor;

  const PromoCard({
    super.key,
    required this.imageUrl,
    required this.discount,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
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
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.7),
            ],
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Limited Time Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                tr.limitedTime,
                style: context.regular11Black,
              ),
            ),
            const Spacer(),
            // Title
            Text(
              tr.getSpecialDiscountInToday,
              style: context.semiBold20White,
            ),
            8.h,
            // Discount
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${tr.upTo}  ',
                    style: context.regular16White,
                  ),
                  TextSpan(
                    text: discount,
                    style: context.semiBold20White.copyWith(
                      color: const Color(0xFFFF8F3A),
                    ),
                  ),
                ],
              ),
            ),
            16.h,
            // Bottom Row
            Row(
              children: [
                Expanded(
                  child: Text(
                    tr.allServicesAvailable,
                    style: context.regular11White,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                16.w,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tr.claimNow,
                    style: context.medium11White,
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
