import 'package:bookly_x/app/core/enums/booking_status.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class StaffBookingActionBottomBar extends StatelessWidget {
  const StaffBookingActionBottomBar({
    super.key,
    required this.status,
    required this.onActionPressed,
  });

  final BookingStatus status;
  final VoidCallback onActionPressed;

  @override
  Widget build(BuildContext context) {
    String? buttonText;
    IconData? buttonIcon;
    bool isContact = false;

    if (status == BookingStatus.confirmed) {
      buttonText = tr.startService;
    } else if (status == BookingStatus.inProgress) {
      buttonText = tr.completeService;
    } else if (status == BookingStatus.canceled ||
        status == BookingStatus.rejected) {
      buttonText = tr.contactClient;
      buttonIcon = Icons.help_outline;
      isContact = true;
    }

    if (buttonText == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.textBorders)),
      ),
      child: CustomButton(
        onPress: onActionPressed,
        title: buttonText,
        buttonColor: isContact
            ? AppColors.dodgerBlue.withValues(alpha: 0.1)
            : AppColors.dodgerBlue,
        titleColor: isContact ? AppColors.dodgerBlue : AppColors.white,
        prefixIcon: buttonIcon,
        prefixIconColor: AppColors.dodgerBlue,
      ),
    );
  }
}
