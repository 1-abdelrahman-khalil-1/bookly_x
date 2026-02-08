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
  });

  /// Local image
  final File? initImage;

  /// Network image
  final String? initImageUrl;

  /// Callback when image changes
  final void Function(File? image)? onImageSelected;

  /// Custom local image builder
  final Widget Function(File image)? imageBuilder;

  final double? height;

  @override
  State<CustomUploadImage> createState() => _CustomUploadImageState();
}

class _CustomUploadImageState extends State<CustomUploadImage> {
  File? _image;
  String? _imageUrl;

  bool get hasImage => _image != null || (_imageUrl?.isNotEmpty ?? false);

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
          ],
        ),
      ),
    );
  }

  Widget _pickOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return CustomInkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.textMain),
          const Width(8),
          Text(text, style: context.medium16),
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
    return CustomInkWell(
      onTap: () => _showPickOptions(context),
      child: hasImage ? _buildImage(context) : _buildPlaceholder(context),
    );
  }

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
            const Icon(
              MyIcons.documentUploadOutline,
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
              '${tr.imageAllowedFormats} : (JPG, PNG)\n Must be not greater Than 2MB',
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
