import 'dart:ui';

import 'package:bookly_x/app/core/data/lang_pref.dart';
import 'package:bookly_x/app/core/enums/booking_status.dart';
import 'package:bookly_x/app/core/extensions/context_extensions.dart';
import 'package:bookly_x/app/core/extensions/date_time_exensions.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/app/features/client/bookings/presentation/widgets/cancel_booking_dialog.dart';
import 'package:bookly_x/app/features/client/bookings/presentation/widgets/reschudle_booking_dialog.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String serviceTitle;
  final String providerName;
  final String imageUrl;
  final BookingStatus status;
  final DateTime date;
  final TimeOfDay time;
  final String staffName;
  final int durationMinutes;
  final double? totalPaid;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onTap;
  final String primaryActionLabel;
  final String? secondaryActionLabel;

  const BookingCard({
    super.key,
    required this.serviceTitle,
    required this.providerName,
    required this.imageUrl,
    required this.status,
    required this.date,
    required this.time,
    required this.staffName,
    required this.durationMinutes,
    this.totalPaid,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onTap,
    required this.primaryActionLabel,
    required this.secondaryActionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.textSub),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Section
            _buildImageSection(context),
            8.h,
            // Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Provider
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              serviceTitle,
                              style: context.regular12.copyWith(
                                color: const Color(0xFF101828),
                              ),
                            ),
                            Text(
                              providerName,
                              style: context.regular11TextSub,
                            ),
                          ],
                        ),
                      ),
                      8.w,
                      // Status Badge
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: status.color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          status.name,
                          style: context.regular11White,
                        ),
                      ),
                    ],
                  ),
                  8.h,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(MyIcons.calendarOutline,
                              size: 12, color: AppColors.textSub),
                          4.w,
                          Text(
                            date.formattedDate,
                            style: context.regular12TextSub,
                          ),
                        ],
                      ),
                      8.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(MyIcons.clockOutline,
                                  size: 12, color: AppColors.textSub),
                              4.w,
                              Text(
                                time.format(context),
                                style: context.regular12TextSub,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(MyIcons.clockOutline,
                                  size: 12, color: AppColors.textSub),
                              4.w,
                              Text(
                                '$durationMinutes ${tr.minutes}',
                                style: context.regular12TextSub,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  8.h,
                  Text(
                    '${tr.kWith} $staffName',
                    style: context.regular12TextSub,
                  ),
                  8.h,
                  Row(
                    children: [
                      // Contact Button
                      Expanded(
                        child: CustomButton(
                          title: tr.contact,
                          onPress: () {},
                          textStyle: context.regular11Black,
                          prefixIcon: MyIcons.messageOutline,
                          prefixIconSize: 12,
                          height: 30,
                          buttonColor: AppColors.white,
                          borderColor: AppColors.textSub,
                          prefixIconColor: AppColors.textSub,
                        ),
                      ),
                      8.w,
                      // Directions Button
                      Expanded(
                        child: CustomButton(
                          title: tr.directions,
                          onPress: () {},
                          textStyle: context.regular11Black,
                          prefixIcon: MyIcons.locationOutline,
                          prefixIconSize: 12,
                          height: 30,
                          buttonColor: AppColors.white,
                          borderColor: AppColors.textSub,
                          prefixIconColor: AppColors.textSub,
                        ),
                      ),
                    ],
                  ),
                  8.h,
                  Row(
                    children: [
                      // Primary Action (Pay/Reschedule/Info)
                      Expanded(
                        child: CustomButton(
                          title: status.isPending
                              ? tr.pay
                              : status.isConfirmed
                                  ? tr.reschedule
                                  : tr.info,
                          onPress: () {
                            if (status.isPending) {
                            } else if (status.isConfirmed) {
                              ReschudleBookingDialog.showBottomSheet(context);
                            } else {}
                          },
                          textStyle: context.regular12White,
                          buttonColor: AppColors.primary,
                          height: 32,
                          borderRadius: 25,
                        ),
                      ),
                      8.w,
                      if (!status.isComplete)
                        // Secondary Action (Cancel)
                        Expanded(
                          child: CustomButton(
                            title: tr.cancel,
                            onPress: () {
                              if (!status.isComplete) {
                                context.showCustomDialog(
                                  content: CancelBookingDialog(
                                    onConfirm: () {
                                      Navigator.pop(context);
                                      // Handle booking cancellation
                                    },
                                    onCancel: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              }
                            },
                            textStyle: context.regular12Danger,
                            buttonColor: AppColors.white,
                            height: 32,
                            borderColor: AppColors.danger,
                            borderRadius: 25,
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
            8.h,
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return SizedBox(
      height: 145,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CustomCachedNetworkImage(
              imgUrl: imageUrl,
              height: 145,
              width: double.infinity,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          // Favorite Button
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: onFavoriteToggle,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.9),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? AppColors.danger : AppColors.textMain,
                  size: 20,
                ),
              ),
            ),
          ),
          // Payment Status Overlay
          if (status.isPending || totalPaid != null)
            Positioned(
                bottom: 112,
                right: isArabic ? 10 : null,
                left: !isArabic ? 10 : null,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: status.isPending
                            ? AppColors.imageOverlay
                            : AppColors.success.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        status.isPending
                            ? tr.waitingForPayment
                            : '${tr.totalPaid}: \$${totalPaid!.toStringAsFixed(1)}',
                        style: context.regular11White,
                      ),
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
