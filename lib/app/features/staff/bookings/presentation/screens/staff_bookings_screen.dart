import 'package:bookly_x_client/app/core/enums/booking_status.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/models/booking_model.dart';
import 'package:bookly_x_client/app/features/staff/bookings/presentation/widgets/staff_booking_card.dart';
import 'package:bookly_x_client/generated/assets.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StaffBookingsScreen extends StatefulWidget {
  const StaffBookingsScreen({super.key});

  @override
  State<StaffBookingsScreen> createState() => _StaffBookingsScreenState();
}

class _StaffBookingsScreenState extends State<StaffBookingsScreen> {
  late final List<BookingModel> _bookings = [
    BookingModel(
      id: '1',
      clientName: 'Sarah Johnson',
      avatarUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=300&auto=format&fit=crop',
      status: BookingStatus.complete,
      serviceName: 'Haircut',
      dateTime: DateTime(2026, 5, 1, 10, 0),
      durationMinutes: 30,
      price: 50,
      notes: 'asdasdasdasdasdasdasd',
    ),
    BookingModel(
      id: '2',
      clientName: 'Robert Brown',
      avatarUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=300&auto=format&fit=crop',
      status: BookingStatus.canceled,
      serviceName: 'Beard Trim',
      dateTime: DateTime(2026, 5, 2, 16, 30),
      durationMinutes: 15,
      price: 25,
    ),
    BookingModel(
      id: '3',
      clientName: 'Maya Williams',
      avatarUrl:
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=300&auto=format&fit=crop',
      status: BookingStatus.pending,
      serviceName: 'Wash & Style',
      dateTime: DateTime(2026, 5, 3, 9, 0),
      durationMinutes: 45,
      price: 35,
    ),
    BookingModel(
      id: '4',
      clientName: 'Chris Evans',
      avatarUrl:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=300&auto=format&fit=crop',
      status: BookingStatus.confirmed,
      serviceName: 'Hair Coloring',
      dateTime: DateTime(2026, 5, 4, 13, 45),
      durationMinutes: 60,
      price: 80,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F8FC),
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Column(
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
              ),
              TabBar(
                labelColor: AppColors.primary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.primary,
                tabs: [
                  Tab(text: tr.pending),
                  Tab(text: tr.open),
                  Tab(text: tr.closed),
                ],
              ),
              12.h,
              Expanded(
                child: TabBarView(
                  children: [
                    _BookingListWidget(
                      bookings: _bookings,
                      filterStatuses: [BookingStatus.confirmed],
                    ),
                    _BookingListWidget(
                      bookings: _bookings,
                      filterStatuses: [BookingStatus.inProgress],
                    ),
                    _BookingListWidget(
                      bookings: _bookings,
                      filterStatuses: [
                        BookingStatus.complete,
                        BookingStatus.canceled
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookingListWidget extends StatelessWidget {
  final List<BookingModel> bookings;
  final List<BookingStatus> filterStatuses;

  const _BookingListWidget({
    required this.bookings,
    required this.filterStatuses,
  });

  @override
  Widget build(BuildContext context) {
    final filtered =
        bookings.where((b) => filterStatuses.contains(b.status)).toList();

    if (filtered.isEmpty) {
      return const BookingsEmptyState();
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      itemBuilder: (context, index) {
        final booking = filtered[index];
        return InkWell(
            onTap: () {
              context.push(StaffBookingDetailsRoute(booking: booking));
            },
            child: StaffBookingCard(booking: booking));
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: filtered.length,
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
