import 'dart:io';

import 'package:flutter/material.dart';

import '../buttons/custom_ink_well.dart';

class CustomUploadLocalImage extends StatelessWidget {
  const CustomUploadLocalImage({
    super.key,
    required this.imageFile,
    this.height,
    this.width,
    this.onClose,
    this.showClose = true,
    this.borderRadius = 5,
  });

  final File imageFile;
  final double? height;
  final double? width;
  final double borderRadius;
  final GestureTapCallback? onClose;
  final bool showClose;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 105,
      width: width ?? 133,
      child: Stack(
        children: [
          Container(
            height: height ?? 105,
            width: width ?? 133,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.file(imageFile, fit: BoxFit.cover),
            ),
          ),
          if (showClose)
            Positioned(
              top: 0,
              right: 0,
              child: CustomInkWell(
                onTap: onClose ?? () {},
                child: const Icon(
                  Icons.close_outlined,
                  color: Colors.deepOrange,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
