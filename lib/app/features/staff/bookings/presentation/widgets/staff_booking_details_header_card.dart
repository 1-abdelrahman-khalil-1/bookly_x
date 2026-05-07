import 'package:bookly_x_client/app/core/enums/booking_status.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class StaffBookingDetailsHeaderCard extends StatelessWidget {
  const StaffBookingDetailsHeaderCard({
    super.key,
    required this.serviceName,
    required this.status,
    required this.price,
  });

  final String serviceName;
  final BookingStatus status;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 4,
                color: status.color,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              serviceName,
                              style: context.bold18Primary
                                  .copyWith(color: AppColors.textMain),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: status.lightColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              status.displayLabel,
                              style: context.bold12Primary
                                  .copyWith(color: status.color),
                            ),
                          ),
                        ],
                      ),
                      8.h,
                      Row(
                        children: [
                          const Icon(MyIcons.moneyOutline,
                              color: AppColors.textSub, size: 20),
                          6.w,
                          Text(
                            '\$${price.toStringAsFixed(2)}',
                            style: context.regular16TextSub,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
