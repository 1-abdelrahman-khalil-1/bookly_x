import 'package:bookly_x/app/core/enums/client_category.dart';
import 'package:bookly_x/app/core/widgets/category_chip.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/home/data/models/category_model.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  final ClientCategory? selectedCategory;
  final Function(ClientCategory) onCategorySelected;
  final List<CategoryModel> categories;

  const CategoriesSection({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.categories,
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
              (index) {
                final cat = categories[index];
                final isSelected = selectedCategory?.name.toUpperCase() ==
                    cat.id.toUpperCase();
                ClientCategory? resolved;
                try {
                  resolved = ClientCategory.fromString(cat.id);
                } catch (_) {}
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: GestureDetector(
                      onTap: () {
                        if (resolved != null) onCategorySelected(resolved);
                      },
                      child: CategoryChip(
                        name: cat.name,
                        imageUrl: cat.image,
                        isActive: isSelected,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
