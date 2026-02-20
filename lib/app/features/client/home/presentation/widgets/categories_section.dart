import 'package:bookly_x_client/app/core/widgets/category_chip.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/features/client/home/data/models/category_model.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

final List<CategoryModel> categories = [
  CategoryModel(
    id: "1",
    name: tr.spas,
    image:
        "https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=200&h=100&fit=crop",
  ),
  CategoryModel(
    id: "2",
    name: tr.clinics,
    image:
        "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=200&h=100&fit=crop",
  ),
  CategoryModel(
    id: "3",
    name: tr.barbers,
    image:
        "https://images.unsplash.com/photo-1503951914875-452162b0f3f1?w=200&h=100&fit=crop",
  ),
];

class CategoriesSection extends StatelessWidget {
  final String? selectedCategory;
  final Function(String) onCategorySelected;

  const CategoriesSection({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

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
                  padding: EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    onTap: () => onCategorySelected(categories[index].id),
                    child: CategoryChip(
                      name: categories[index].name,
                      imageUrl: categories[index].image,
                      isActive: selectedCategory == categories[index].id,
                    ),
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
