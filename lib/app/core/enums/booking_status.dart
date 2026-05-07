import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

enum BookingStatus {
  pending,
  confirmed,
  inProgress,
  complete,
  canceled,
  rejected,
}

extension BookingStatusX on BookingStatus {
  Color get color {
    switch (this) {
      case BookingStatus.pending:
        return AppColors.warningBadge;
      case BookingStatus.confirmed:
        return AppColors.primary;
      case BookingStatus.inProgress:
        return AppColors
            .warningBadge; // Or a specific warning color for inProgress
      case BookingStatus.complete:
        return AppColors.successBadge;
      case BookingStatus.canceled:
      case BookingStatus.rejected:
        return AppColors.danger;
    }
  }

  Color get lightColor {
    switch (this) {
      case BookingStatus.pending:
        return AppColors.warningLight;
      case BookingStatus.confirmed:
        return AppColors.lightBlue;
      case BookingStatus.inProgress:
        return AppColors.warningLight; // usually yellow/orange tint
      case BookingStatus.complete:
        return AppColors.successLight;
      case BookingStatus.canceled:
      case BookingStatus.rejected:
        return AppColors.dangerLight;
    }
  }

  String get displayLabel {
    switch (this) {
      case BookingStatus.pending:
        return tr.pending;
      case BookingStatus.confirmed:
        return tr.accepted; // Use accepted instead of confirmed as per Figma
      case BookingStatus.inProgress:
        return tr.inProgress;
      case BookingStatus.complete:
        return tr.completed;
      case BookingStatus.canceled:
        return tr.canceled;
      case BookingStatus.rejected:
        return tr.rejected;
    }
  }

  static BookingStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'pending':
        return BookingStatus.pending;
      case 'confirmed':
      case 'accepted':
      case 'open':
        return BookingStatus.confirmed;
      case 'inprogress':
      case 'in_progress':
        return BookingStatus.inProgress;
      case 'complete':
      case 'completed':
      case 'closed':
        return BookingStatus.complete;
      case 'canceled':
      case 'cancelled':
        return BookingStatus.canceled;
      case 'rejected':
        return BookingStatus.rejected;
      default:
        return BookingStatus.pending;
    }
  }

  bool get isPending =>
      this == BookingStatus.pending || this == BookingStatus.confirmed;
  bool get isConfirmed => this == BookingStatus.confirmed;
  bool get isInProgress => this == BookingStatus.inProgress;
  bool get isComplete => this == BookingStatus.complete;
  bool get isCanceled =>
      this == BookingStatus.canceled || this == BookingStatus.rejected;

  bool get isOpen => this == BookingStatus.inProgress;
  bool get isClosed =>
      this == BookingStatus.complete ||
      this == BookingStatus.canceled ||
      this == BookingStatus.rejected;
}
