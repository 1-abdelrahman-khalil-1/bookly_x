import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class StaffAppointmentCard extends StatelessWidget {
  const StaffAppointmentCard({
    super.key,
    required this.statusLabel,
    required this.statusStyle,
    required this.statusBackground,
    required this.accentColor,
    required this.timeLabel,
    required this.customerName,
    required this.serviceName,
    required this.actionLabel,
    required this.actionBackground,
    required this.actionTitleColor,
    required this.actionIcon,
  });

  final String statusLabel;
  final TextStyle statusStyle;
  final Color statusBackground;
  final Color accentColor;
  final String timeLabel;
  final String customerName;
  final String serviceName;
  final String actionLabel;
  final Color actionBackground;
  final Color actionTitleColor;
  final IconData actionIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.textBorders),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusBackground,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Badge(
                                backgroundColor:
                                    statusStyle.color ?? AppColors.primary,
                                smallSize: 6,
                              ),
                              4.w,
                              Text(statusLabel, style: statusStyle),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(
                              MyIcons.clockOutline,
                              color: AppColors.textSub,
                              size: 16,
                            ),
                            4.w,
                            Text(timeLabel, style: context.regular14TextSub),
                          ],
                        ),
                      ],
                    ),
                    18.h,
                    Text(customerName, style: context.bold18Primary),
                    6.h,
                    Row(
                      children: [
                        const Icon(
                          MyIcons.scissorOutline,
                          size: 16,
                          color: AppColors.textSub,
                        ),
                        6.w,
                        Text(serviceName, style: context.regular14TextSub),
                      ],
                    ),
                    16.h,
                    CustomButton(
                      title: actionLabel,
                      prefixIcon: actionIcon,
                      prefixIconSize: 16,
                      height: 42,
                      borderRadius: 10,
                      buttonColor: actionBackground,
                      titleColor: actionTitleColor,
                      prefixIconColor: actionTitleColor,
                      onPress: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
