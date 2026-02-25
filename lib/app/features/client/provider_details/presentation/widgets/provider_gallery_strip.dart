import 'dart:ui';

import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

/// Horizontally scrollable strip of thumbnail images that sits over the
/// transition between the cover image and the white body card.
class ProviderGalleryStrip extends StatelessWidget {
  const ProviderGalleryStrip({super.key, required this.imageUrls});

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.22),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageUrls
                  .map(
                    (url) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _GalleryThumb(imgUrl: url),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _GalleryThumb extends StatelessWidget {
  const _GalleryThumb({required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: CustomCachedNetworkImage(
          imgUrl: imgUrl,
          width: 75,
          height: 75,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
