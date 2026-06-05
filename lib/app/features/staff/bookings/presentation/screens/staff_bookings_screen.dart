import 'package:bookly_x/app/core/extensions/context_extensions.dart';
import 'package:bookly_x/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/staff/bookings/presentation/controller/staff_bookings_future_providers.dart';
import 'package:bookly_x/app/features/staff/bookings/presentation/widgets/staff_booking_card.dart';
import 'package:bookly_x/app/features/staff/bookings/presentation/widgets/staff_bookings_shimmer.dart';
import 'package:bookly_x/generated/assets.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class StaffBookingsScreen extends StatefulWidget {
  const StaffBookingsScreen({super.key});

  @override
  State<StaffBookingsScreen> createState() => _StaffBookingsScreenState();
}

class _StaffBookingsScreenState extends State<StaffBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F8FC),
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr.bookingManagement, style: context.bold24TextMain),
                    8.h,
                    Text(
                      tr.reviewYourBookingHistory,
                      style: context.regular16TextSub,
                    ),
                    16.h,
                  ],
                ),
                TabBar(
                  labelColor: AppColors.primary,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: AppColors.primary,
                  padding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(text: tr.pending),
                    Tab(text: tr.open),
                    Tab(text: tr.closed),
                  ],
                ),
                12.h,
                const Expanded(
                  child: TabBarView(
                    children: [
                      _BookingListWidget(
                        status: "pending",
                      ),
                      _BookingListWidget(
                        status: "open",
                      ),
                      _BookingListWidget(
                        status: "closed",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BookingListWidget extends ConsumerWidget {
  final String status;

  const _BookingListWidget({
    required this.status,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(staffBookingsFutureProvider(status));
      },
      child: ref.watchWhen(
        provider: staffBookingsFutureProvider(status),
        loading: () => const StaffBookingsShimmer(),
        data: (bookings) {
          if (bookings.isEmpty) {
            return const BookingsEmptyState();
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return InkWell(
                  onTap: () {
                    context.push(StaffBookingDetailsRoute(booking: booking));
                  },
                  child: StaffBookingCard(booking: booking));
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: bookings.length,
          );
        },
      ),
    );
  }
}

class BookingsEmptyState extends StatelessWidget {
  const BookingsEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.lottiesAppointmentCalendarLottieAnimation,
          ),
          Text(
            tr.noAppointments,
            style: context.semiBold18,
          ),
          16.h,
          Text(
            tr.noAppointmentsDescription,
            style: context.regular18TextSub,
          ),
        ],
      ),
    );
  }
}
