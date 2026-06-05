import 'package:bookly_x/app/core/models/booking_model.dart';
import 'package:bookly_x/app/features/staff/bookings/data/service/staff_booking_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staffBookingsFutureProvider =
    FutureProvider.family<List<BookingModel>, String>((ref, status) async {
  return await ref
      .read(staffBookingServiceProvider)
      .getBookings(status: status);
});

final staffBookingByIdFutureProvider = FutureProvider.family<BookingModel, int>(
    (ref, id) async {
  return await ref.read(staffBookingServiceProvider).getBookingById(id: id);
});