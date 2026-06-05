import 'package:bookly_x/app/core/enums/booking_status.dart';
import 'package:bookly_x/app/core/enums/weeks_days_enum.dart';
import 'package:bookly_x/app/core/extensions/date_time_exensions.dart';
import 'package:bookly_x/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/shimmer/booking_card_shimmer.dart';
import 'package:bookly_x/app/features/staff/home/presentation/controllers/staff_home_future_provider.dart';
import 'package:bookly_x/app/features/staff/home/presentation/widgets/staff_appointment_card.dart';
import 'package:bookly_x/app/features/staff/home/presentation/widgets/staff_empty_schedule_state.dart';
import 'package:bookly_x/app/features/staff/home/presentation/widgets/staff_home_header.dart';
import 'package:bookly_x/app/features/staff/home/presentation/widgets/staff_schedule_shimmer.dart';
import 'package:bookly_x/app/features/staff/home/presentation/widgets/staff_week_chip.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StaffHomeScreen extends ConsumerStatefulWidget {
  const StaffHomeScreen({super.key});

  @override
  ConsumerState<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends ConsumerState<StaffHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ref.watchWhen(
              provider: staffHomeFutureProvider,
              skipLoadingOnReload: true,
              loading: StaffScheduleShimmer.new,
              data: (data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StaffHomeHeader(),
                    24.h,
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async =>
                            ref.invalidate(staffHomeFutureProvider),
                        child: ListView(
                          children: [
                            Text(tr.thisWeek, style: context.bold18Primary),
                            12.h,
                            SizedBox(
                              height: 88,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                separatorBuilder: (_, __) => 10.w,
                                itemBuilder: (context, index) {
                                  final date =
                                      DateTime.now().add(Duration(days: index));
                                  final day =
                                      WeeksDaysEnum.values[date.weekday % 7];
                                  final isSelected =
                                      date.year == selectedDate.year &&
                                          date.month == selectedDate.month &&
                                          date.day == selectedDate.day;
                                  final now = DateTime.now();

                                  final isToday = date.year == now.year &&
                                      date.month == now.month &&
                                      date.day == now.day;
                                  return StaffWeekChip(
                                    day: day,
                                    dayNumber: isToday
                                        ? tr.today
                                        : date.day.toString(),
                                    isSelected: isSelected,
                                    onTap: () {
                                      ref
                                          .read(selectedDateProvider.notifier)
                                          .state = date;
                                    },
                                  );
                                },
                              ),
                            ),
                            24.h,
                            Text(
                              selectedDate.isToday
                                  ? tr.todaysSchedule
                                  : WeeksDaysEnum
                                      .values[selectedDate.weekday % 7]
                                      .displayName,
                              style: context.bold18Primary,
                            ),
                            16.h,
                            ref.watchWhen(
                              provider: staffHomeFutureProvider,
                              loading: () => ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                separatorBuilder: (_, __) => 20.h,
                                itemBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: BookingCardShimmer(),
                                ),
                              ),
                              data: (schedules) {
                                if (schedules.isEmpty) {
                                  return const StaffEmptyScheduleState();
                                }

                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: schedules.length,
                                  separatorBuilder: (_, __) => 20.h,
                                  itemBuilder: (context, index) {
                                    final item = schedules[index];
                                    final status = item.status;
                                    final actionInfo = _getActionInfo(status);

                                    return StaffAppointmentCard(
                                      statusLabel: status.displayLabel,
                                      statusStyle: context.semiBold12Primary
                                          .copyWith(color: status.color),
                                      statusBackground: status.lightColor,
                                      accentColor: status.color,
                                      timeLabel: item.scheduledAt.formattedTime,
                                      customerName: item.client.name,
                                      serviceName: item.service.name,
                                      actionLabel: actionInfo.label,
                                      actionIcon: actionInfo.icon,
                                      actionBackground: actionInfo.bg,
                                      actionTitleColor: actionInfo.text,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }

  ({String label, IconData icon, Color bg, Color text}) _getActionInfo(
      BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return (
          label: tr.accept,
          icon: MyIcons.tickCircleOutline,
          bg: AppColors.primary,
          text: AppColors.white
        );
      case BookingStatus.confirmed:
        return (
          label: tr.start,
          icon: MyIcons.playCircleOutline,
          bg: AppColors.successBadge,
          text: AppColors.white
        );
      case BookingStatus.inProgress:
        return (
          label: tr.complete,
          icon: MyIcons.tickCircleOutline,
          bg: AppColors.successBadge,
          text: AppColors.white
        );
      default:
        return (
          label: tr.viewDetails,
          icon: MyIcons.eyeOutline,
          bg: AppColors.textPlaceholder,
          text: AppColors.primary
        );
    }
  }
}
