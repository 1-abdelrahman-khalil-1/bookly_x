import 'package:bookly_x/app/core/widgets/shimmer/booking_card_shimmer.dart';
import 'package:flutter/material.dart';

class StaffBookingsShimmer extends StatelessWidget {
  const StaffBookingsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const BookingCardShimmer();
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 10,
    );
  }
}
