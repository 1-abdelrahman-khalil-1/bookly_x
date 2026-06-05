import 'dart:math';

import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../shimmer/shimmer_box.dart';

class CustomCachedNetworkImage extends StatefulWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.imgUrl,
    this.placeholderPath,
    this.fit,
    this.width = 213,
    this.height = 167,
    this.borderRadius,
    this.boxShape = BoxShape.rectangle,
    this.placeholderWidget,
  });

  final double? height;
  final double? width;

  final String? imgUrl;
  final String? placeholderPath;
  final Widget? placeholderWidget;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape boxShape;

  @override
  State<CustomCachedNetworkImage> createState() =>
      _CustomCachedNetworkImageState();
}

class _CustomCachedNetworkImageState extends State<CustomCachedNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Hero(
        tag: widget.imgUrl != null && widget.imgUrl!.isNotEmpty
            ? widget.imgUrl! +
                (kDebugMode ? Random().nextInt(10000000).toString() : '')
            : 'https://static.vecteezy.com/system/resources/previews/002/534/006/non_2x/social-media-chatting-online-blank-profile-picture-head-and-body-icon-people-standing-icon-grey-background-free-vector.jpg ${kDebugMode ? Random().nextInt(10000000).toString() : ''}',
        child: CachedNetworkImage(
          imageUrl: widget.imgUrl != null && widget.imgUrl!.isNotEmpty
              ? widget.imgUrl!
              : 'https://static.vecteezy.com/system/resources/previews/002/534/006/non_2x/social-media-chatting-online-blank-profile-picture-head-and-body-icon-people-standing-icon-grey-background-free-vector.jpg',
          height: widget.height,
          width: widget.width,
          filterQuality: FilterQuality.medium,
          imageBuilder: (context, imageProvider) => Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              shape: widget.boxShape,
              borderRadius: widget.boxShape == BoxShape.circle
                  ? null
                  : (widget.borderRadius ??
                      const BorderRadius.all(
                        Radius.circular(Constants.borderRadius),
                      )),
              image: DecorationImage(
                image: imageProvider,
                fit: widget.fit ?? BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              shape: widget.boxShape,
              borderRadius: widget.boxShape == BoxShape.circle
                  ? null
                  : (widget.borderRadius ??
                      const BorderRadius.all(
                        Radius.circular(Constants.borderRadius),
                      )),
              color: Colors.grey,
            ),
            child: ShimmerBox(
              boxShape: widget.boxShape,
              borderRadius: widget.boxShape == BoxShape.circle
                  ? null
                  : (widget.borderRadius ??
                      const BorderRadius.all(
                        Radius.circular(Constants.borderRadius),
                      )),
              child: widget.placeholderWidget ??
                  (widget.placeholderPath != null
                      ? Image.asset(widget.placeholderPath!)
                      : const Icon(Icons.image,
                          size: 32, color: AppColors.textSub)),
            ),

            /// todo uncomment
            // errorWidget: (context, url, error) {
            //   return Center(
            //     child: SvgPicture.asset(
            //       Assets.iconsBrokenStoreLogo,
            //     ),
            //   );
            // },
          ),
        ),
      ),
    );
  }
}
