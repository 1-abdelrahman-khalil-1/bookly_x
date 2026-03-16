import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class BookingServiceModel {
  final int id;
  final String name;
  final String category;
  final double price;
  final int durationMinutes;

  const BookingServiceModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.durationMinutes,
  });

  static List<BookingServiceModel> get mockServices => [
        BookingServiceModel(
          id: 1,
          name: "Men's Haircut",
          category: tr.barbers,
          price: 120,
          durationMinutes: 30,
        ),
        BookingServiceModel(
          id: 2,
          name: "HairCuting",
          category: tr.barbers,
          price: 150,
          durationMinutes: 45,
        ),
        BookingServiceModel(
          id: 3,
          name: "Classic Shave",
          category: tr.barbers,
          price: 80,
          durationMinutes: 20,
        ),
        BookingServiceModel(
          id: 4,
          name: "Deep Tissue Massage",
          category: tr.spas,
          price: 250,
          durationMinutes: 60,
        ),
        BookingServiceModel(
          id: 5,
          name: "Swedish Massage",
          category: tr.spas,
          price: 200,
          durationMinutes: 60,
        ),
        BookingServiceModel(
          id: 6,
          name: "Skin Consultation",
          category: tr.clinics,
          price: 300,
          durationMinutes: 30,
        ),
      ];
}

class StaffModel {
  final int id;
  final String name;
  final String role;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final String coverImageUrl;
  final List<String> galleryUrls;
  final String about;
  final String category;
  final int clientsCount;
  final int yearsExperience;
  final List<ClientStaffWorkPlaceModel> workPlaces;
  final List<ClientStaffReviewModel> reviews;

  const StaffModel({
    required this.id,
    required this.name,
    required this.role,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.coverImageUrl,
    required this.galleryUrls,
    required this.about,
    required this.category,
    required this.clientsCount,
    required this.yearsExperience,
    required this.workPlaces,
    required this.reviews,
  });

  static const List<StaffModel> mockStaff = [
    StaffModel(
      id: 1,
      name: 'John Smith',
      role: 'Master Barber',
      rating: 5.0,
      reviewCount: 332,
      imageUrl:
          'https://images.unsplash.com/photo-1567894340315-735d7c361db0?q=80&w=437&auto=format&fit=crop',
      coverImageUrl:
          'https://images.unsplash.com/photo-1621605815971-fbc98d665033?q=80&w=1770&auto=format&fit=crop',
      galleryUrls: [
        'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?q=80&w=400&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1622286342621-4bd786c2447c?q=80&w=400&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1595476108010-b4d1f102b1b1?q=80&w=400&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1519014816548-bf5fe059798b?q=80&w=400&auto=format&fit=crop',
      ],
      about:
          'Dr. Carly Angel is one of the top specialists with long practical experience in customer care and quality sessions.',
      category: 'Oil Massage | Spa Section',
      clientsCount: 120,
      yearsExperience: 7,
      workPlaces: [
        ClientStaffWorkPlaceModel(
          id: 1,
          name: 'Xps Spa Center',
          subtitle: 'Oil Massage | Spa Section',
          rating: 5.0,
          reviewCount: 332,
          location: 'Banha, Qlubia',
          imageUrl:
              'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?q=80&w=500&auto=format&fit=crop',
        ),
        ClientStaffWorkPlaceModel(
          id: 2,
          name: 'Xps Spa Center',
          subtitle: 'Oil Massage | Spa Section',
          rating: 5.0,
          reviewCount: 332,
          location: 'Banha, Qlubia',
          imageUrl:
              'https://images.unsplash.com/photo-1600334129128-685c5582fd35?q=80&w=500&auto=format&fit=crop',
        ),
      ],
      reviews: [
        ClientStaffReviewModel(
          id: 1,
          reviewerName: 'Mr. Jack',
          avatarUrl:
              'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=200&auto=format&fit=crop',
          comment:
              'The rental car was clean, reliable, and the service was quick and efficient. Overall, the experience was hassle-free and enjoyable.',
          rating: 5,
          day: ClientStaffReviewDay.today,
        ),
        ClientStaffReviewModel(
          id: 2,
          reviewerName: 'Robert',
          avatarUrl:
              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=200&auto=format&fit=crop',
          comment:
              'Professional and friendly specialist. The session quality was excellent and I will definitely book again.',
          rating: 5,
          day: ClientStaffReviewDay.yesterday,
        ),
      ],
    ),
    StaffModel(
      id: 2,
      name: 'John Smith',
      role: 'Master Barber',
      rating: 4.5,
      reviewCount: 98,
      imageUrl:
          'https://images.unsplash.com/photo-1567894340315-735d7c361db0?q=80&w=437&auto=format&fit=crop',
      coverImageUrl:
          'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?q=80&w=1770&auto=format&fit=crop',
      galleryUrls: [
        'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?q=80&w=400&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1522338242992-e1a54906a8da?q=80&w=400&auto=format&fit=crop',
      ],
      about:
          'Experienced specialist focused on modern techniques and premium products for stable quality results.',
      category: 'Hair Styling | Salon Section',
      clientsCount: 80,
      yearsExperience: 5,
      workPlaces: [
        ClientStaffWorkPlaceModel(
          id: 3,
          name: 'Urban Beauty House',
          subtitle: 'Hair Styling | Salon Section',
          rating: 4.8,
          reviewCount: 121,
          location: 'Cairo, Egypt',
          imageUrl:
              'https://images.unsplash.com/photo-1632345031435-8727f6897d53?q=80&w=500&auto=format&fit=crop',
        ),
      ],
      reviews: [
        ClientStaffReviewModel(
          id: 3,
          reviewerName: 'Aly',
          avatarUrl:
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=200&auto=format&fit=crop',
          comment: 'Excellent service and very respectful communication.',
          rating: 5,
          day: ClientStaffReviewDay.today,
        ),
      ],
    ),
    StaffModel(
      id: 3,
      name: 'John Smith',
      role: 'Master Barber',
      rating: 4.5,
      reviewCount: 75,
      imageUrl:
          'https://images.unsplash.com/photo-1567894340315-735d7c361db0?q=80&w=437&auto=format&fit=crop',
      coverImageUrl:
          'https://images.unsplash.com/photo-1467399324425-fb1d5cc7d25f?q=80&w=1770&auto=format&fit=crop',
      galleryUrls: [],
      about: 'Trusted specialist with consistent quality standards.',
      category: 'Spa Section',
      clientsCount: 63,
      yearsExperience: 4,
      workPlaces: [],
      reviews: [],
    ),
    StaffModel(
      id: 4,
      name: 'John Smith',
      role: 'Master Barber',
      rating: 4.5,
      reviewCount: 53,
      imageUrl:
          'https://images.unsplash.com/photo-1567894340315-735d7c361db0?q=80&w=437&auto=format&fit=crop',
      coverImageUrl:
          'https://images.unsplash.com/photo-1519415943484-9fa1873496d4?q=80&w=1770&auto=format&fit=crop',
      galleryUrls: [],
      about:
          'Detail-oriented expert with a strong customer satisfaction record.',
      category: 'Spa Section',
      clientsCount: 45,
      yearsExperience: 3,
      workPlaces: [],
      reviews: [],
    ),
    StaffModel(
      id: 5,
      name: 'John Smith',
      role: 'Master Barber',
      rating: 4.5,
      reviewCount: 40,
      imageUrl:
          'https://images.unsplash.com/photo-1567894340315-735d7c361db0?q=80&w=437&auto=format&fit=crop',
      coverImageUrl:
          'https://images.unsplash.com/photo-1512290923902-8a9f81dc236c?q=80&w=1770&auto=format&fit=crop',
      galleryUrls: [],
      about: 'Skilled specialist delivering fast and clean results.',
      category: 'Spa Section',
      clientsCount: 38,
      yearsExperience: 3,
      workPlaces: [],
      reviews: [],
    ),
  ];
}

class ClientStaffWorkPlaceModel {
  final int id;
  final String name;
  final String subtitle;
  final double rating;
  final int reviewCount;
  final String location;
  final String imageUrl;

  const ClientStaffWorkPlaceModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.reviewCount,
    required this.location,
    required this.imageUrl,
  });
}

class ClientStaffReviewModel {
  final int id;
  final String reviewerName;
  final String avatarUrl;
  final String comment;
  final int rating;
  final ClientStaffReviewDay day;

  const ClientStaffReviewModel({
    required this.id,
    required this.reviewerName,
    required this.avatarUrl,
    required this.comment,
    required this.rating,
    required this.day,
  });
}

enum ClientStaffReviewDay {
  today,
  yesterday,
}

class BookingFlowData {
  final BookingServiceModel? selectedService;
  final StaffModel? selectedStaff;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final bool isAm;

  const BookingFlowData({
    this.selectedService,
    this.selectedStaff,
    this.selectedDate,
    this.selectedTime,
    this.isAm = true,
  });

  BookingFlowData copyWith({
    BookingServiceModel? selectedService,
    StaffModel? selectedStaff,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    bool? isAm,
  }) {
    return BookingFlowData(
      selectedService: selectedService ?? this.selectedService,
      selectedStaff: selectedStaff ?? this.selectedStaff,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      isAm: isAm ?? this.isAm,
    );
  }

  String get formattedDateRange {
    if (selectedDate == null) return '';
    final d = selectedDate!;
    return '${_monthShort(d.month)}${d.day}-${_monthShort(d.month)}${d.day + 1}';
  }

  String get formattedDateTime {
    if (selectedDate == null || selectedTime == null) return '';
    final d = selectedDate!;
    final t = selectedTime!;
    final hour = t.hour == 0
        ? 12
        : t.hour > 12
            ? t.hour - 12
            : t.hour;
    final minute = t.minute.toString().padLeft(2, '0');
    final period = isAm ? 'AM' : 'PM';
    return '${_monthShort(d.month)} ${d.day}, ${d.year} at $hour:$minute $period';
  }

  String _monthShort(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  Color get statusColor => AppColors.warning;
  String get statusLabel => 'padening confirmation';
  String get priceLabel =>
      selectedService != null ? '${selectedService!.price.toInt()}EG' : '';
}
