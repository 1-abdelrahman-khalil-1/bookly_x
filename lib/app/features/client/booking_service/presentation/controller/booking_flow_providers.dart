import 'package:bookly_x_client/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingFlowDataProvider =
    StateProvider<BookingFlowData>((ref) => const BookingFlowData());

final bookingStepProvider = StateProvider<int>((ref) => 0);

final bookingSelectedServiceIdProvider = StateProvider<int?>((ref) => null);

final bookingSelectedStaffIdProvider = StateProvider<int?>((ref) => null);

final bookingAvailableTimeSlotsProvider =
    Provider.family<List<TimeOfDay>, DateTime>((ref, date) {
  final weekday = date.weekday;

  switch (weekday) {
    case DateTime.monday:
      return const [
        TimeOfDay(hour: 9, minute: 0),
        TimeOfDay(hour: 10, minute: 30),
        TimeOfDay(hour: 12, minute: 0),
        TimeOfDay(hour: 14, minute: 0),
        TimeOfDay(hour: 16, minute: 0),
      ];
    case DateTime.tuesday:
      return const [
        TimeOfDay(hour: 8, minute: 30),
        TimeOfDay(hour: 10, minute: 0),
        TimeOfDay(hour: 11, minute: 30),
        TimeOfDay(hour: 13, minute: 30),
        TimeOfDay(hour: 15, minute: 30),
      ];
    case DateTime.wednesday:
      return const [
        TimeOfDay(hour: 9, minute: 30),
        TimeOfDay(hour: 11, minute: 0),
        TimeOfDay(hour: 13, minute: 0),
        TimeOfDay(hour: 15, minute: 0),
        TimeOfDay(hour: 17, minute: 0),
      ];
    case DateTime.thursday:
      return const [
        TimeOfDay(hour: 10, minute: 0),
        TimeOfDay(hour: 11, minute: 30),
        TimeOfDay(hour: 13, minute: 30),
        TimeOfDay(hour: 15, minute: 30),
      ];
    case DateTime.friday:
      return const [
        TimeOfDay(hour: 12, minute: 0),
        TimeOfDay(hour: 13, minute: 30),
        TimeOfDay(hour: 15, minute: 0),
        TimeOfDay(hour: 16, minute: 30),
      ];
    case DateTime.saturday:
      return const [
        TimeOfDay(hour: 9, minute: 0),
        TimeOfDay(hour: 10, minute: 0),
        TimeOfDay(hour: 11, minute: 0),
        TimeOfDay(hour: 12, minute: 0),
        TimeOfDay(hour: 13, minute: 0),
        TimeOfDay(hour: 14, minute: 0),
      ];
    case DateTime.sunday:
      return const [
        TimeOfDay(hour: 11, minute: 0),
        TimeOfDay(hour: 12, minute: 30),
        TimeOfDay(hour: 14, minute: 0),
      ];
    default:
      return const [];
  }
});