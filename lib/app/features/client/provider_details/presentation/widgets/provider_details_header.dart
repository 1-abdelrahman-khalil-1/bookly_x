import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/app/features/client/provider_details/presentation/widgets/provider_gallery_strip.dart';
import 'package:flutter/material.dart';

class ProviderDetailsHeader extends StatelessWidget {
  const ProviderDetailsHeader({
    super.key,
    required this.coverImageUrl,
    required this.galleryUrls,
  });

  final String coverImageUrl;
  final List<String> galleryUrls;

  @override
  Widget build(BuildContext context) {
    return Stack(
      //  fit: StackFit.expand,
      children: [
        // Cover image
        CustomCachedNetworkImage(
          imgUrl: coverImageUrl,
          width: double.infinity,
          height: double.infinity,
        ),

        // Gradient overlay for readability
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.4),
                Colors.transparent,
                Colors.black.withValues(alpha: 0.15),
              ],
            ),
          ),
        ),

        // Back / Favorite / Share row
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _CircleIconButton(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      size: 18, color: Colors.black87),
                ),
                const Spacer(),
                _CircleIconButton(
                  onTap: () {},
                  child: const Icon(Icons.favorite_rounded,
                      size: 20, color: AppColors.danger),
                ),
                const SizedBox(width: 10),
                _CircleIconButton(
                  onTap: () {},
                  child: const Icon(Icons.share_rounded,
                      size: 20, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          left: 16,
          child: ProviderGalleryStrip(imageUrls: galleryUrls),
        )
      ],
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.onTap, required this.child});

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
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
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
