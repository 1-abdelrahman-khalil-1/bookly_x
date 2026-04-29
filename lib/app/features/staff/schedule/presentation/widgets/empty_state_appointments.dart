import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class EmptyStateAppointments extends StatelessWidget {
  const EmptyStateAppointments({super.key, this.isUpcoming = true});
  final bool isUpcoming;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            isUpcoming
                ? MyIcons.calendarRemoveOutline
                : MyIcons.calendarTickOutline,
            size: 48,
            color: AppColors.textSub),
        24.h,
        Text(isUpcoming ? tr.noUpcomingAppointments : tr.noAppointmentsToday,
            style: context.regular14TextSub),
      ],
    );
  }
}
