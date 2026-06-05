import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:flutter/material.dart';

class ClientStaffInfoHeaderSection extends StatelessWidget {
  const ClientStaffInfoHeaderSection({super.key, required this.staff});

  final StaffModel staff;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCachedNetworkImage(
          imgUrl: staff.coverImageUrl,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withValues(alpha: 0.35),
                AppColors.black.withValues(alpha: 0),
                AppColors.black.withValues(alpha: 0.15),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                _ClientStaffCircleButton(
                  onTap: () => context.pop(),
                  child: const Icon(
                    MyIcons.arrowLeftOutline,
                    color: AppColors.textMain,
                    size: 18,
                  ),
                ),
                const Spacer(),
                _ClientStaffCircleButton(
                  onTap: () {},
                  child: const Icon(
                    MyIcons.heartBold,
                    color: AppColors.danger,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ClientStaffCircleButton extends StatelessWidget {
  const _ClientStaffCircleButton({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.12),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
