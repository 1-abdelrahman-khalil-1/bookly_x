import 'package:bookly_x_client/app/core/enums/booking_status.dart';
import 'package:flutter/material.dart';

class BookingData {
  final int id;
  final String serviceTitle;
  final String providerName;
  final String imageUrl;
  final BookingStatus status;
  final DateTime date;
  final TimeOfDay time;
  final String staffName;
  final int durationMinutes;
  final double? totalPaid;

  BookingData({
    required this.id,
    required this.serviceTitle,
    required this.providerName,
    required this.imageUrl,
    required this.status,
    required this.date,
    required this.time,
    required this.staffName,
    required this.durationMinutes,
    this.totalPaid,
  });

  // Mock data for pending bookings
  static final List<BookingData> mockPendingBookings = [
    BookingData(
      id: 1,
      serviceTitle: "Men's Haircut",
      providerName: 'Elite Barber Studio',
      imageUrl:
          'https://images.unsplash.com/photo-1567894340315-735d7c361db0?q=80&w=437&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      status: BookingStatus.pending,
      date: DateTime(2025, 10, 5),
      time: const TimeOfDay(hour: 10, minute: 0),
      staffName: 'John Smith',
      durationMinutes: 45,
    ),
    BookingData(
      id: 2,
      serviceTitle: "Men's Haircut",
      providerName: 'Elite Barber Studio',
      imageUrl:
          'https://images.unsplash.com/photo-1605497788044-5a32c7078486?w=400&h=300&fit=crop',
      status: BookingStatus.pending,
      date: DateTime(2025, 10, 5),
      time: const TimeOfDay(hour: 10, minute: 0),
      staffName: 'John Smith',
      durationMinutes: 45,
    ),
    BookingData(
      id: 3,
      serviceTitle: "Men's Haircut",
      providerName: 'Elite Barber Studio',
      imageUrl:
          'https://images.unsplash.com/photo-1605497788044-5a32c7078486?w=400&h=300&fit=crop',
      status: BookingStatus.pending,
      date: DateTime(2025, 10, 5),
      time: const TimeOfDay(hour: 10, minute: 0),
      staffName: 'John Smith',
      durationMinutes: 45,
    ),
    BookingData(
      id: 4,
      serviceTitle: "Men's Haircut",
      providerName: 'Elite Barber Studio',
      imageUrl:
          'https://images.unsplash.com/photo-1567894340315-735d7c361db0?q=80&w=437&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      status: BookingStatus.pending,
      date: DateTime(2025, 10, 5),
      time: const TimeOfDay(hour: 10, minute: 0),
      staffName: 'John Smith',
      durationMinutes: 45,
    ),
  ];

  // Mock data for upcoming bookings
  static final List<BookingData> mockUpcomingBookings = [
    BookingData(
      id: 5,
      serviceTitle: "Deep Tissue Massage",
      providerName: 'Serenity Spa Center',
      imageUrl:
          'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=400&h=300&fit=crop',
      status: BookingStatus.confirmed,
      date: DateTime(2025, 10, 12),
      time: const TimeOfDay(hour: 14, minute: 30),
      staffName: 'Samir Johnson',
      durationMinutes: 60,
      totalPaid: 28,
    ),
    BookingData(
      id: 6,
      serviceTitle: "Skin Consultation",
      providerName: 'Glow Dermatology Clinic',
      imageUrl:
          'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=400&h=300&fit=crop',
      status: BookingStatus.confirmed,
      date: DateTime(2025, 10, 15),
      time: const TimeOfDay(hour: 11, minute: 0),
      staffName: 'Dr. Michael Chen',
      durationMinutes: 30,
      totalPaid: 28,
    ),
  ];

  // Mock data for complete bookings
  static final List<BookingData> mockCompleteBookings = [
    BookingData(
      id: 7,
      serviceTitle: "Classic Shave & Trim",
      providerName: 'Gentleman Grooming',
      imageUrl:
          'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=400&h=300&fit=crop',
      status: BookingStatus.complete,
      date: DateTime(2025, 9, 20),
      time: const TimeOfDay(hour: 9, minute: 30),
      staffName: 'Ahmed Hassan',
      durationMinutes: 40,
      totalPaid: 28,
    ),
    BookingData(
      id: 8,
      serviceTitle: "Swedish Massage",
      providerName: 'Wellness Spa Retreat',
      imageUrl:
          'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=400&h=300&fit=crop',
      status: BookingStatus.complete,
      date: DateTime(2025, 9, 15),
      time: const TimeOfDay(hour: 16, minute: 0),
      staffName: 'Leo Martinez',
      durationMinutes: 90,
      totalPaid: 28,
    ),
  ];
}
