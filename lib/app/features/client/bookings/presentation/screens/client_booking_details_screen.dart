import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/enums/booking_status.dart';
import 'package:bookly_x/app/core/extensions/context_extensions.dart';
import 'package:bookly_x/app/core/extensions/date_time_exensions.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/app/features/client/bookings/data/models/booking_data.dart';
import 'package:bookly_x/app/features/client/bookings/presentation/widgets/cancel_booking_dialog.dart';
import 'package:bookly_x/app/features/client/bookings/presentation/widgets/reschudle_booking_dialog.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientBookingDetailsScreen extends StatelessWidget {
  final BookingData booking;

  const ClientBookingDetailsScreen({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: tr.bookingDetail),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.textBorders),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: CustomCachedNetworkImage(
                        imgUrl: booking.imageUrl,
                        height: 220,
                        width: double.infinity,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  booking.serviceTitle,
                                  style: context.semiBold16TextMain,
                                ),
                              ),
                              8.w,
                              _StatusBadge(status: booking.status),
                            ],
                          ),
                          6.h,
                          Text(
                            booking.providerName,
                            style: context.regular12TextSub,
                          ),
                          const Divider(color: AppColors.textBorders),
                          _DetailsRow(
                            icon: MyIcons.calendarOutline,
                            title: tr.bookingId,
                            value: '#${booking.id}',
                          ),
                          10.h,
                          _DetailsRow(
                            icon: MyIcons.calendarOutline,
                            title: tr.bookingDate,
                            value: booking.date.formattedDate,
                          ),
                          10.h,
                          _DetailsRow(
                            icon: MyIcons.clockOutline,
                            title: tr.time,
                            value: booking.time.format(context),
                          ),
                          10.h,
                          _DetailsRow(
                            icon: MyIcons.clockOutline,
                            title: tr.minutes,
                            value: '${booking.durationMinutes} ${tr.minutes}',
                          ),
                          10.h,
                          _DetailsRow(
                            icon: MyIcons.profile2userOutline,
                            title: tr.specialist,
                            value: booking.staffName,
                          ),
                          if (booking.totalPaid != null) ...[
                            10.h,
                            _DetailsRow(
                              icon: MyIcons.clockOutline,
                              title: tr.totalPaid,
                              value:
                                  '\$${booking.totalPaid!.toStringAsFixed(2)}',
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              16.h,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: tr.contact,
                      onPress: () {},
                      buttonColor: AppColors.white,
                      borderColor: AppColors.textBorders,
                      titleColor: AppColors.textMain,
                      prefixIcon: MyIcons.messageOutline,
                      prefixIconColor: AppColors.textSub,
                    ),
                  ),
                  12.w,
                  Expanded(
                    child: CustomButton(
                      title: tr.directions,
                      onPress: () {},
                      buttonColor: AppColors.white,
                      borderColor: AppColors.textBorders,
                      titleColor: AppColors.textMain,
                      prefixIcon: MyIcons.locationOutline,
                      prefixIconColor: AppColors.textSub,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Primary Action (Pay/Reschedule/Info)
            Expanded(
              child: CustomButton(
                title: booking.status.isPending
                    ? tr.pay
                    : booking.status.isConfirmed
                        ? tr.reschedule
                        : tr.info,
                onPress: () {
                  if (booking.status.isPending) {
                  } else if (booking.status.isConfirmed) {
                    ReschudleBookingDialog.showBottomSheet(context);
                  } else {}
                },
                textStyle: context.regular12White,
                buttonColor: AppColors.primary,
                borderRadius: 25,
              ),
            ),
            8.w,
            if (!booking.status.isComplete)
              // Secondary Action (Cancel)
              Expanded(
                child: CustomButton(
                  title: tr.cancel,
                  onPress: () {
                    if (!booking.status.isComplete) {
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
                  borderColor: AppColors.danger,
                  borderRadius: 25,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final BookingStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status.name,
        style: context.regular12White,
      ),
    );
  }
}

class _DetailsRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DetailsRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: AppColors.textSub),
        8.w,
        Expanded(
          child: Text(
            title,
            style: context.regular12TextSub,
          ),
        ),
        8.w,
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: context.semiBold16TextMain,
          ),
        ),
      ],
    );
  }
}
