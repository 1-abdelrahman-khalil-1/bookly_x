import 'dart:io';

import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_ink_well.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_upload_local_image.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CustomUploadImage extends StatefulWidget {
  const CustomUploadImage({
    super.key,
    this.onImageSelected,
    this.height,
    this.initImage,
    this.initImageUrl,
    this.imageBuilder,
    this.width,
    this.borderRadius = 5,
    this.isCircular = false,
    this.circularRadius = 60,
    this.icon,
    this.placeholderIcon,
    this.placeholderIconSize,
    this.iconSize = 12,
    this.profileSize = 60,
    this.iconColor,
    this.iconBgColor,
    this.iconBorderColor,
    this.placeholderBgColor,
    this.placeholderBorderColor,
    this.placeholderIconColor,
  });

  /// Local image
  final File? initImage;

  /// Network image
  final String? initImageUrl;
  final double? width;
  final double borderRadius;
  final double? iconSize;
  final double? profileSize;
  final IconData? placeholderIcon;
  final double? placeholderIconSize;
  final Color? iconColor;
  final Color? iconBgColor;
  final Color? iconBorderColor;
  final Color? placeholderBgColor;
  final Color? placeholderBorderColor;
  final Color? placeholderIconColor;
  final void Function(File? image)? onImageSelected;

  /// Custom local image builder
  final Widget Function(File image)? imageBuilder;

  final double? height;

  /// When true, renders a circular profile-photo style picker instead of
  /// the dotted-border document-upload style.
  final bool isCircular;

  /// Radius used for the circular avatar (half the diameter).
  /// Defaults to 60 logical pixels.
  final double circularRadius;

  /// Icon displayed in the placeholder / camera badge.
  /// Defaults to [FontAwesomeIcons.camera] when null.
  final IconData? icon;

  @override
  State<CustomUploadImage> createState() => _CustomUploadImageState();
}

class _CustomUploadImageState extends State<CustomUploadImage> {
  File? _image;
  String? _imageUrl;

  bool get hasImage => _image != null || (_imageUrl?.isNotEmpty ?? false);

  IconData get _effectiveIcon => widget.icon ?? FontAwesomeIcons.camera;

  @override
  void initState() {
    super.initState();
    _syncFromWidget();
  }

  @override
  void didUpdateWidget(covariant CustomUploadImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initImage != widget.initImage ||
        oldWidget.initImageUrl != widget.initImageUrl) {
      _syncFromWidget();
    }
  }

  void _syncFromWidget() {
    _image = widget.initImage;
    _imageUrl = widget.initImageUrl;
  }

  Future<void> _pickImage(ImageSource source) async {
    final picked = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
    );

    if (picked == null) return;

    final file = File(picked.path);
    setState(() {
      _image = file;
      _imageUrl = null;
    });

    widget.onImageSelected?.call(file);
  }

  void _showPickOptions(BuildContext context) {
    context.showBottomSheet(
      bottomSheetBody: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _pickOption(
              icon: FontAwesomeIcons.camera,
              text: tr.camera,
              onTap: () {
                _pickImage(ImageSource.camera);
                context.pop();
              },
            ),
            const Height(24),
            _pickOption(
              icon: FontAwesomeIcons.image,
              text: tr.gallery,
              onTap: () {
                _pickImage(ImageSource.gallery);
                context.pop();
              },
            ),
            if (hasImage) ...[
              const Height(24),
              _pickOption(
                icon: FontAwesomeIcons.trash,
                text: tr.delete,
                color: AppColors.danger,
                onTap: () {
                  _clearImage();
                  context.pop();
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _pickOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? color,
  }) {
    return CustomInkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color ?? AppColors.textMain),
          const Width(8),
          Text(
            text,
            style: context.medium16.copyWith(color: color),
          ),
        ],
      ),
    );
  }

  void _clearImage() {
    setState(() {
      _image = null;
      _imageUrl = null;
    });
    widget.onImageSelected?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isCircular) {
      return CustomInkWell(
        onTap: () => _showPickOptions(context),
        child: _buildCircularPicker(context),
      );
    }

    return CustomInkWell(
      onTap: () => _showPickOptions(context),
      child: hasImage ? _buildImage(context) : _buildPlaceholder(context),
    );
  }

  // ─────────────────────────── Circular (profile) mode ────────────────────────

  Widget _buildCircularPicker(BuildContext context) {
    final double diameter = widget.profileSize ?? (widget.circularRadius * 1.5);

    return Badge(
      alignment: Alignment.centerRight,
      offset: const Offset(-8, 8),
      backgroundColor: widget.iconBgColor ?? Colors.transparent,
      padding: EdgeInsets.zero,
      label: Container(
        width: widget.iconSize != null ? widget.iconSize! + 17 : 30,
        height: widget.iconSize != null ? widget.iconSize! + 17 : 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.iconBgColor,
          border: widget.iconBorderColor != null
              ? Border.all(
                  color: widget.iconBorderColor!,
                  width: 2,
                )
              : null,
        ),
        child: Icon(
          _effectiveIcon,
          size: widget.iconSize ?? 13,
          color: widget.iconColor,
        ),
      ),
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.placeholderBgColor ?? AppColors.primaryLightHover,
          border: widget.placeholderBorderColor != null
              ? Border.all(
                  color: widget.placeholderBorderColor!,
                  width: 2,
                )
              : null,
        ),
        child: ClipOval(child: _buildCircularImageContent(diameter)),
      ),
    );
  }

  Widget _buildCircularImageContent(double diameter) {
    // Local file
    if (_image != null) {
      return Image.file(_image!,
          fit: BoxFit.cover, width: diameter, height: diameter);
    }

    // Network URL
    if (_imageUrl != null && _imageUrl!.isNotEmpty) {
      return CustomCachedNetworkImage(
        imgUrl: _imageUrl!,
        width: diameter,
        height: diameter,
        fit: BoxFit.cover,
        boxShape: BoxShape.circle,
        placeholderWidget: Center(
          child: Icon(
            widget.placeholderIcon ?? Icons.broken_image_outlined,
            size: widget.placeholderIconSize ?? (diameter * 0.45),
            color: widget.placeholderIconColor ?? AppColors.primary,
          ),
        ),
      );
    }

    // Placeholder icon
    return Center(
      child: Icon(
        widget.placeholderIcon ?? Icons.broken_image_outlined,
        size: widget.placeholderIconSize ?? (diameter * 0.45),
        color: widget.placeholderIconColor ?? AppColors.primary,
      ),
    );
  }

  // ─────────────────────────── Rectangular (document) mode ────────────────────

  Widget _buildPlaceholder(BuildContext context) {
    return DottedBorder(
      color: Colors.grey.shade400,
      strokeWidth: 1,
      dashPattern: const [6, 4],
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon ?? MyIcons.documentUploadOutline,
              size: 24,
              color: AppColors.textSub,
            ),
            const Height(8),
            Text(
              tr.selectImageToUpload,
              style: context.regular14Primary.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            const Height(8),
            Text(
              '${tr.imageAllowedFormats} : (JPG, PNG)\n ${tr.mustBeNotGreaterThan2mb}',
              textAlign: TextAlign.center,
              style: context.regular14TextSub,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    /// Local file
    if (_image != null) {
      if (widget.imageBuilder != null) {
        return widget.imageBuilder!(_image!);
      }

      return CustomUploadLocalImage(
        width: context.width,
        height: widget.height ?? 200,
        borderRadius: widget.borderRadius,
        imageFile: _image!,
        onClose: _clearImage,
      );
    }

    /// Network image
    if (_imageUrl != null && _imageUrl!.isNotEmpty) {
      return Stack(
        children: [
          CustomCachedNetworkImage(
            imgUrl: _imageUrl!,
            width: context.width,
            height: widget.height ?? 200,
            fit: BoxFit.cover,
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: CustomInkWell(
              onTap: _clearImage,
              child: const Icon(Icons.delete, color: Colors.deepOrange),
            ),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
