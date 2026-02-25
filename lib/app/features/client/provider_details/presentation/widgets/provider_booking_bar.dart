import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

/// Sticky bottom bar: total price on the left, "Booking Now" button on the right.
class ProviderBookingBar extends StatelessWidget {
  const ProviderBookingBar({
    super.key,
    required this.totalPrice,
    required this.currency,
    this.onBook,
  });

  final double totalPrice;
  final String currency;
  final VoidCallback? onBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withValues(alpha: 0.12)),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Price column
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(tr.totalPrice, style: context.regular12TextSub),
                2.h,
                Text(
                  '$totalPrice $currency',
                  style: context.bold24Black,
                ),
              ],
            ),
          ),
          const Spacer(),
          // Booking button
          GestureDetector(
            onTap: onBook ?? () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shopping_basket_outlined,
                      color: Colors.white, size: 20),
                  8.w,
                  Text(tr.bookingNow, style: context.regular14White),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
