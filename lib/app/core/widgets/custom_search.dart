import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomSearch<T> extends StatelessWidget {
  final void Function(T) onSelected;
  final Future<List<T>> Function(String)? suggestionsCallback;
  final void Function()? onFilterTap;
  const CustomSearch({
    super.key,
    required this.onSelected,
    this.suggestionsCallback,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T>(
      builder: (context, controller, focusNode) {
        return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: '${tr.search}...',
              hintStyle: context.regular14TextSub,
              prefixIconColor: AppColors.textSub,
              prefixIcon: const Icon(MyIcons.searchNormalOutline),
              suffixIcon: onFilterTap != null
                  ? GestureDetector(
                      onTap: onFilterTap,
                      child: const Icon(
                        MyIcons.candle2Outline,
                        color: AppColors.textSub,
                      ),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.black, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.textBorders),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.black, width: 1),
              ),
            ));
      },
      emptyBuilder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(tr.noResultsFound, style: context.regular14TextSub),
      ),
      suggestionsCallback: (pattern) async {
        return await suggestionsCallback?.call(pattern) ?? <T>[];
      },
      itemBuilder: (context, suggestion) {
        return ListTile(title: Text(suggestion.toString()));
      },
      onSelected: onSelected,
    );
  }
}
