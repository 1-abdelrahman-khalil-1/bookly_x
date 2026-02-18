import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/features/client/bookings/data/models/booking_data.dart';
import 'package:bookly_x_client/app/features/client/bookings/presentation/widgets/booking_card.dart';
import 'package:bookly_x_client/app/features/client/bookings/presentation/widgets/booking_tab_bar.dart';
import 'package:bookly_x_client/app/features/client/bookings/presentation/widgets/cancel_booking_dialog.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int _selectedTabIndex = 0;
  final Map<int, bool> _favorites = {};

  List<BookingData> get _currentBookings {
    switch (_selectedTabIndex) {
      case 0:
        return BookingData.mockPendingBookings;
      case 1:
        return BookingData.mockUpcomingBookings;
      case 2:
        return BookingData.mockCompleteBookings;
      default:
        return [];
    }
  }

  void _toggleFavorite(int id) {
    setState(() {
      _favorites[id] = !(_favorites[id] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Tab Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: BookingTabBar(
                selectedIndex: _selectedTabIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
                tabs: [
                  tr.pending,
                  tr.upcoming,
                  tr.complete,
                ],
              ),
            ),
            // Booking Cards
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                child: _currentBookings.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Text(
                            tr.noBookingsYet,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      )
                    : Wrap(
                        spacing: 16,
                        runSpacing: 9,
                        children: _currentBookings.map((booking) {
                          return SizedBox(
                            width: context.width * 0.5 - 20,
                            child: BookingCard(
                              serviceTitle: booking.serviceTitle,
                              providerName: booking.providerName,
                              imageUrl: booking.imageUrl,
                              status: booking.status,
                              date: booking.date,
                              time: booking.time,
                              staffName: booking.staffName,
                              durationMinutes: booking.durationMinutes,
                              totalPaid: booking.totalPaid,
                              isFavorite: _favorites[booking.id] ?? false,
                              onFavoriteToggle: () =>
                                  _toggleFavorite(booking.id),
                              onContact: () {
                                // Handle contact action
                              },
                              onDirections: () {
                                // Handle directions action
                              },
                              onPrimaryAction: () {
                                // Handle primary action (Pay/Reschedule/Info)
                              },
                              onSecondaryAction: () {
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
                              primaryActionLabel: booking.status.isPending
                                  ? tr.pay
                                  : booking.status.isConfirmed
                                      ? tr.reschedule
                                      : tr.info,
                              secondaryActionLabel: tr.cancel,
                            ),
                          );
                        }).toList(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
