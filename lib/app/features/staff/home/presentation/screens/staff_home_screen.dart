import 'package:bookly_x_client/app/core/constants/constants.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/app/features/staff/home/presentation/widgets/staff_appointment_card.dart';
import 'package:bookly_x_client/app/features/staff/home/presentation/widgets/staff_empty_schedule_state.dart';
import 'package:bookly_x_client/app/features/staff/home/presentation/widgets/staff_week_chip.dart';
import 'package:bookly_x_client/app/features/staff/main_screen/data/enums/staff_week_day.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentCards = <Widget>[
      StaffAppointmentCard(
        accentColor: AppColors.primary2,
        statusLabel: tr.accepted,
        statusStyle: context.semiBold14Primary,
        statusBackground: AppColors.lightBlue,
        timeLabel: '10:00 AM',
        customerName: tr.jamesMiller,
        serviceName: tr.fullGrooming,
        actionLabel: tr.startService,
        actionBackground: AppColors.primary2,
        actionTitleColor: AppColors.white,
        actionIcon: MyIcons.playOutline,
      ),
      StaffAppointmentCard(
        accentColor: AppColors.warning,
        statusLabel: tr.inProgress,
        statusStyle: context.semiBold14Warning,
        statusBackground: AppColors.warningLight,
        timeLabel: '10:00 AM',
        customerName: tr.sampleSecondCustomerName,
        serviceName: tr.haircutStyling,
        actionLabel: tr.kContinue,
        actionBackground: AppColors.textBorders,
        actionTitleColor: AppColors.primary2,
        actionIcon: MyIcons.arrowRightOutline,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteCatskillWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CustomCachedNetworkImage(
                        imgUrl: Constants.tempImage,
                        width: 40,
                        height: 40,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      Positioned(
                        bottom: -2,
                        right: -2,
                        child: Container(
                          width: 11,
                          height: 11,
                          decoration: BoxDecoration(
                            color: AppColors.success,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppColors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.w,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr.goodMorningAlex, style: context.bold16),
                        4.h,
                        Text(
                          tr.hereIsYourScheduleForToday,
                          style: context.regular14TextSub,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push(const StaffProfileRoute()),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.textBorders),
                      ),
                      child: const Icon(
                        MyIcons.setting2Outline,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              24.h,
              Row(
                children: [
                  Text(tr.thisWeek, style: context.bold18Primary),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: const Icon(MyIcons.arrowRightOutline, size: 18),
                    label: Text(tr.viewFull, style: context.semiBold14Primary),
                  ),
                ],
              ),
              12.h,
              SizedBox(
                height: 88,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: StaffWeekDay.values.length,
                  separatorBuilder: (_, __) => 10.w,
                  itemBuilder: (context, index) {
                    final day = StaffWeekDay.values[index];
                    return StaffWeekChip(
                      day: day,
                      dayNumber: '${12 + index}',
                      isSelected: day == StaffWeekDay.wednesday,
                    );
                  },
                ),
              ),
              24.h,
              Text(tr.todaysSchedule, style: context.bold18Primary),
              16.h,
              if (appointmentCards.isEmpty)
                const StaffEmptyScheduleState()
              else
                Column(
                  children: [
                    for (final card in appointmentCards) ...[
                      card,
                      16.h,
                    ],
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
