part of '../screens/staff_profile_screen.dart';

class WorkScheduleSection extends StatelessWidget {
  const WorkScheduleSection({
    super.key,
    required this.availabilities,
  });

  final List<StaffAvailabilityModel> availabilities;

  @override
  Widget build(BuildContext context) {
    final activeDays = availabilities
        .map((availability) => availability.weekDay)
        .whereType<WeeksDaysEnum>()
        .toSet();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: const Border(
          left: BorderSide(color: AppColors.primary2, width: 3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.03),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tr.workSchedule, style: context.bold18Primary),
          16.h,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final day in WeeksDaysEnum.values)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: activeDays.contains(day)
                        ? AppColors.primary
                        : AppColors.textBorders,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    day.shortCode.toUpperCase(),
                    style: activeDays.contains(day)
                        ? context.regular14White
                        : context.regular14TextSub,
                  ),
                ),
            ],
          ),
          18.h,
          CustomButtonOutlined(
            title: tr.editSchedule,
            height: 40,
            borderRadius: 12,
            borderColor: AppColors.primary,
            titleColor: AppColors.primary,
            buttonColor: AppColors.white,
            prefixIcon: MyIcons.edit2Outline,
            prefixIconColor: AppColors.primary,
            onPress: () {
              StaffWorkScheduleBottomSheet.showBottomSheet(
                context,
                availabilities: availabilities,
              );
            },
          ),
        ],
      ),
    );
  }
}
