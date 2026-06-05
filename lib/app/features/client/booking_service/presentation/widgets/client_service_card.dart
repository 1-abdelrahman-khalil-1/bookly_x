import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class ClientServiceCard extends StatelessWidget {
  final BookingServiceModel service;
  final bool isSelected;
  final VoidCallback onTap;

  const ClientServiceCard({
    super.key,
    required this.service,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.textBorders,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.name, style: context.semiBold14TextMain),
                  4.h,
                  Text(service.category, style: context.regular12TextSub),
                  8.h,
                  Row(
                    children: [
                      Text(
                        '${service.price.toInt()} EG',
                        style: context.semiBold14Primary,
                      ),
                      12.w,
                      Text(
                        '${service.durationMinutes} min',
                        style: context.regular12TextSub,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 16),
              ),
          ],
        ),
      ),
    );
  }
}
