import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/staff/main_screen/data/enums/staff_week_day.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_contact_row.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_specialty_chip.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_week_label_chip.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_work_schedule_bottom_sheet.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StaffProfileScreen extends StatelessWidget {
  const StaffProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteCatskillWhite,
      appBar: CustomAppbar(title: tr.profileSetting),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.04),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=200&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 2,
                          child: Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                              color: AppColors.success,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.white, width: 2),
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
                          Text(tr.jamesMiller, style: context.bold20Primary),
                          6.h,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              tr.seniorSpecialist,
                              style: context.semiBold14Primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              16.h,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.03),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      MyIcons.smsStarBold,
                      color: AppColors.warningBadge,
                      size: 22,
                    ),
                    8.w,
                    Text('4.8', style: context.bold16),
                    4.w,
                    Text(tr.reviewsCount, style: context.regular14TextSub),
                    const Spacer(),
                    Text(tr.viewAll, style: context.semiBold14Primary),
                  ],
                ),
              ),
              16.h,
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.03),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    StaffContactRow(
                      icon: MyIcons.smsEditOutline,
                      title: tr.email,
                      value: tr.sampleEmail,
                    ),
                    16.h,
                    StaffContactRow(
                      icon: MyIcons.callOutline,
                      title: tr.phoneNumber,
                      value: tr.samplePhone,
                    ),
                    16.h,
                    StaffContactRow(
                      icon: MyIcons.profileOutline,
                      title: tr.age,
                      value: tr.sampleAge,
                    ),
                    16.h,
                    StaffContactRow(
                      icon: MyIcons.calendarOutline,
                      title: tr.joined,
                      value: tr.sampleJoinedDate,
                    ),
                  ],
                ),
              ),
              16.h,
              Text(tr.specialties, style: context.bold18Primary),
              12.h,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  StaffSpecialtyChip(label: tr.hairStyling),
                  StaffSpecialtyChip(label: tr.beardTrim),
                  StaffSpecialtyChip(label: tr.skinCare),
                  StaffSpecialtyChip(label: tr.scalpMassage),
                ],
              ),
              16.h,
              Container(
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
                    Row(
                      children: [
                        Text(tr.workSchedule, style: context.bold18Primary),
                        const Spacer(),
                        Text(tr.selectAll, style: context.semiBold14Primary),
                      ],
                    ),
                    16.h,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final day in StaffWeekDay.values)
                          StaffWeekLabelChip(
                            day: day,
                            isSelected: day.index < 5,
                          ),
                      ],
                    ),
                    18.h,
                    CustomButtonOutlined(
                      title: tr.editSchedule,
                      height: 50,
                      borderRadius: 12,
                      borderColor: AppColors.primary,
                      titleColor: AppColors.primary,
                      buttonColor: AppColors.white,
                      prefixIcon: MyIcons.edit2Outline,
                      prefixIconColor: AppColors.primary,
                      onPress: () {
                        StaffWorkScheduleBottomSheet.showBottomSheet(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
