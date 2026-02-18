import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

enum BookingStatus {
  pending,
  confirmed,
  complete;

  Color get color {
    switch (this) {
      case BookingStatus.pending:
        return AppColors.warningBadge.withValues(alpha: 0.74);
      case BookingStatus.confirmed:
        return AppColors.primary;
      case BookingStatus.complete:
        return AppColors.successBadge;
    }
  }

  String get name {
    switch (this) {
      case BookingStatus.pending:
        return tr.pending;
      case BookingStatus.confirmed:
        return tr.confirmed;
      case BookingStatus.complete:
        return tr.complete;
    }
  }

  bool get isPending => this == BookingStatus.pending;
  bool get isConfirmed => this == BookingStatus.confirmed;
  bool get isComplete => this == BookingStatus.complete;
}
