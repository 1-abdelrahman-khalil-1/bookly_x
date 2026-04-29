import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

/// Seller row: avatar, name, verified badge, owner label, call & message icons.
class ProviderSellerSection extends StatelessWidget {
  const ProviderSellerSection({
    super.key,
    required this.sellerName,
    required this.ownerName,
    required this.avatarUrl,
    this.isVerified = true,
    this.onCall,
    this.onMessage,
  });

  final String sellerName;
  final String ownerName;
  final String avatarUrl;
  final bool isVerified;
  final VoidCallback? onCall;
  final VoidCallback? onMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Avatar
            ClipOval(
              child: CustomCachedNetworkImage(
                imgUrl: avatarUrl,
                width: 50,
                height: 50,
              ),
            ),
            10.w,
            // Name + owner
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(sellerName, style: context.medium16Black),
                      6.w,
                      if (isVerified)
                        const Icon(
                          Icons.verified_rounded,
                          color: AppColors.primary,
                          size: 16,
                        ),
                    ],
                  ),
                  2.h,
                  Text('${tr.owner} ($ownerName)',
                      style: context.regular12TextSub),
                ],
              ),
            ),
            // Action icons
            _ActionIconButton(
              icon: Icons.phone_outlined,
              onTap: onCall ?? () {},
            ),
            8.w,
            _ActionIconButton(
              icon: Icons.chat_bubble_outline_rounded,
              onTap: onMessage ?? () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionIconButton extends StatelessWidget {
  const _ActionIconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.textBorders),
          color: Colors.white,
        ),
        child: Icon(icon, size: 18, color: AppColors.textSub),
      ),
    );
  }
}
