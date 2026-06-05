import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientStaffCard extends StatelessWidget {
  final StaffModel staff;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onInfoTap;

  const ClientStaffCard({
    super.key,
    required this.staff,
    required this.isSelected,
    required this.onTap,
    required this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.textBorders,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomCachedNetworkImage(
                imgUrl: staff.imageUrl,
                width: 60,
                height: 60,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            12.w,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(staff.name, style: context.semiBold14TextMain),
                  4.h,
                  Text(staff.role, style: context.regular12TextSub),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Icon(MyIcons.starBold,
                        color: AppColors.warning, size: 16),
                    4.w,
                    Text(
                      '${staff.rating}(${tr.review})',
                      style: context.regular12TextMain,
                    ),
                  ],
                ),
                4.h,
                GestureDetector(
                  onTap: onInfoTap,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.textSub,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.textBorders),
                    ),
                    child: Row(
                      children: [
                        const Icon(FontAwesomeIcons.squareUpRight,
                            size: 18, color: AppColors.white),
                        4.w,
                        Text(
                          tr.info,
                          style: context.semiBold11White,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
