import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/constants/constants.dart';
import 'package:bookly_x_client/app/core/data/lang_pref.dart';
import 'package:bookly_x_client/app/core/enums/weeks_days_enum.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/extensions/date_time_exensions.dart';
import 'package:bookly_x_client/app/core/models/user_model.dart';
import 'package:bookly_x_client/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x_client/app/core/services/session_reset_service.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/custom_transform_arabic.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_availability_model.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_role_enum.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_service_model.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/controllers/staff_profile_future_provider.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_profile_shimmer.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_work_schedule_bottom_sheet.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/main.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../widgets/staff_information_section.dart';
part '../widgets/staff_setting_section.dart';
part '../widgets/staff_speciality_section.dart';
part '../widgets/work_schedule_section.dart';

@RoutePage()
class StaffProfileScreen extends ConsumerWidget {
  const StaffProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppbar(title: tr.profileSetting),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ref.watchWhen(
            provider: staffProfileFutureProvider,
            loading: StaffProfileShimmer.new,
            data: (data) {
              final staff = data.staff;
              return ListView(
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
                        CustomCachedNetworkImage(
                          imgUrl: staff?.profileImageUrl ?? Constants.tempImage,
                          width: 50,
                          height: 50,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        16.w,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.name, style: context.bold20),
                              6.h,
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.lightBlue.withValues(alpha: .6),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  staff?.professionalProfile?.specialization ??
                                      staff?.staffRole.label ??
                                      tr.seniorSpecialist,
                                  style: context.semiBold14PrimaryDark,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
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
                          MyIcons.starBold,
                          color: AppColors.warningBadge,
                          size: 22,
                        ),
                        8.w,
                        Text(staff?.averageRating.toStringAsFixed(1) ?? '0.0',
                            style: context.bold16),
                        4.w,
                        Text(
                          '(${staff?.reviewCount ?? 0} ${tr.reviews})',
                          style: context.regular14TextSub,
                        ),
                        const Spacer(),
                        if (staff!.reviewCount > 0)
                          GestureDetector(
                            onTap: () =>
                                context.push(const StaffReviewsRoute()),
                            child: Text(
                              tr.viewAll,
                              style: context.semiBold14Primary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  16.h,
                  StaffInforamtionSection(user: data),
                  const Divider(
                      color: AppColors.textBorders, height: 40, thickness: 2),
                  StaffSpecialitySection(services: staff.services ?? const []),
                  const Divider(
                      color: AppColors.textBorders, height: 40, thickness: 2),
                  WorkScheduleSection(
                    availabilities: staff.availabilities ?? const [],
                  ),
                  const Divider(
                      color: AppColors.textBorders, height: 40, thickness: 2),
                  const StaffSettingSection(),
                  24.h,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

extension _StaffRoleLabelExtension on StaffRole {
  String get label {
    return name
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}')
        .replaceAll('_', ' ')
        .trim()
        .toUpperCase();
  }
}
