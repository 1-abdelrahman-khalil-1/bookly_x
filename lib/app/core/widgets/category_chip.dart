import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isActive;

  const CategoryChip({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        border:
            isActive ? Border.all(color: AppColors.primary, width: 2) : null,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.5),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          name,
          style: context.bold12White,
        ),
      ),
    );
  }
}
