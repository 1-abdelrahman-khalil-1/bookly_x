import 'package:bookly_x_client/app/core/widgets/category_chip.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  final List<Map<String, String>> categories = const [
    {
      'name': 'SPA',
      'image':
          'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=200&h=100&fit=crop',
    },
    {
      'name': 'Barber',
      'image':
          'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?w=200&h=100&fit=crop',
    },
    {
      'name': 'Clinic',
      'image':
          'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=200&h=100&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr.categories,
            style: context.regular18,
          ),
          16.h,
          Row(
            children: List.generate(
              categories.length,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: index < categories.length - 1 ? 6 : 0),
                  child: CategoryChip(
                    name: categories[index]['name']!,
                    imageUrl: categories[index]['image']!,
                    isActive: index == 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
