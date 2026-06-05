import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/offers/data/model/offer_model.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class OfferHorizontalCard extends StatelessWidget {
  final OfferModel offer;
  final Color buttonColor;
  const OfferHorizontalCard(
      {super.key, required this.offer, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(offer.imageUrl),
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
                    text: offer.discount,
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
