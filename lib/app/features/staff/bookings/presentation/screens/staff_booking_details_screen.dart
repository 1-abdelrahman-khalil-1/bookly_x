import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/models/booking_model.dart';
import 'package:bookly_x/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/staff/bookings/presentation/controller/staff_bookings_future_providers.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/staff_booking_attachments_card.dart';
import '../widgets/staff_booking_client_card.dart';
import '../widgets/staff_booking_date_duration_row.dart';
import '../widgets/staff_booking_details_header_card.dart';
import '../widgets/staff_booking_notes_card.dart';

@RoutePage()
class StaffBookingDetailsScreen extends ConsumerWidget {
  const StaffBookingDetailsScreen({
    super.key,
    required this.booking,
  });

  final BookingModel booking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppbar(title: tr.appointmentDetails),
      body: ref.watchWhen(
        provider: staffBookingByIdFutureProvider(booking.id),
        data: (booking) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StaffBookingDetailsHeaderCard(
                serviceName: booking.service.name,
                status: booking.status,
                price: booking.service.price,
              ),
              12.h,
              StaffBookingClientCard(
                name: booking.client.name,
                phone: booking.client.phone,
                avatarUrl: booking.client.avatarUrl,
                onCallPressed: () {
                  // Handle call action
                },
              ),
              12.h,
              StaffBookingDateDurationRow(
                dateTime: booking.scheduledAt,
                durationMinutes: booking.service.durationMinutes,
              ),
              if (booking.notes != null) ...[
                12.h,
                StaffBookingNotesCard(notes: booking.notes!),
              ],
              if (booking.hasAttachments) ...[
                12.h,
                StaffBookingAttachmentsCard(
                    hasAttachments: booking.hasAttachments),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.textBorders)),
        ),
        child: CustomButton(
            onPress: () {},
            title: booking.status.isPending
                ? tr.startService
                : booking.status.isInProgress
                    ? tr.completeService
                    : tr.contactClient,
            buttonColor: booking.status.isPending || booking.status.isInProgress
                ? AppColors.dodgerBlue.withValues(alpha: 0.1)
                : AppColors.dodgerBlue,
            titleColor: booking.status.isPending || booking.status.isInProgress
                ? AppColors.dodgerBlue
                : AppColors.white,
            prefixIcon: booking.status.isComplete || booking.status.isCanceled
                ? Icons.help_outline
                : booking.status.isPending
                    ? MyIcons.playOutline
                    : null,
            prefixIconColor:
                booking.status.isComplete || booking.status.isCanceled
                    ? AppColors.white
                    : AppColors.dodgerBlue),
      ),
    );
  }
}
//  if (status == BookingStatus.confirmed) {
//       buttonText = tr.startService;
//     } else if (status == BookingStatus.inProgress) {
//       buttonText = tr.completeService;
//     } else if (status == BookingStatus.canceled ||
//         status == BookingStatus.rejected) {
//       buttonText = tr.contactClient;
//       buttonIcon = Icons.help_outline;
//       isContact = true;
//     }
