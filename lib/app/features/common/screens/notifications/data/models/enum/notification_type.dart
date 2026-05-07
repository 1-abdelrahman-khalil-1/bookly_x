import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:flutter/material.dart';

enum NotificationType {
  booking,
  promo,
  payment,
  reminder,
  info;

  IconData get icon {
    switch (this) {
      case NotificationType.booking:
        return MyIcons.calendarBold;
      case NotificationType.promo:
        return MyIcons.ticketDiscountBold;
      case NotificationType.payment:
        return MyIcons.walletBold;
      case NotificationType.reminder:
        return MyIcons.clockBold;
      case NotificationType.info:
        return Icons.info;
    }
  }

  bool get isBooking => this == NotificationType.booking;
  bool get isPromo => this == NotificationType.promo;
  bool get isPayment => this == NotificationType.payment;
  bool get isReminder => this == NotificationType.reminder;
  bool get isInfo => this == NotificationType.info;
}
