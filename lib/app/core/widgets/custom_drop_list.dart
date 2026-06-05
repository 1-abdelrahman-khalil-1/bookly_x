import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_searchable_dropdown/flutter_searchable_dropdown.dart';

class CustomDropList extends StatelessWidget {
  const CustomDropList({
    super.key,
    this.label,
    required this.items,
    this.value,
    required this.onChanged,
    this.hintText,
    this.isRequired = false,
    this.isSearchable = false,
    this.borderColor = AppColors.textBorders,
    this.hintTextStyle,
  });

  final String? label;
  final bool isRequired;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final bool isSearchable;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 16.0, color: Colors.black),
              children: [
                TextSpan(text: label, style: context.medium14TextMain),
                if (isRequired)
                  TextSpan(text: ' *', style: context.medium14Danger),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.white,
          ),
          height: isSearchable ? 51 : 50,
          child: !isSearchable
              ? DropdownButtonFormField<String>(
                  initialValue: value,
                  iconSize: 20,
                  icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      MyIcons.arrowDownOutline,
                      color: AppColors.textSub,
                    ),
                  ),
                  style: context.medium14TextMain.copyWith(height: .5),
                  menuMaxHeight: 300,
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: context.medium14TextMain.copyWith(height: .5),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: onChanged,
                  hint: Text(
                    hintText ?? '${tr.pleaseSelect} $label',
                    style: hintTextStyle ?? context.regular12TextSub,
                  ),
                  validator: (value) {
                    if (isRequired) {
                      return value == null ? hintText : null;
                    } else {
                      return null;
                    }
                  },
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.textBorders, width: .2),
                  ),
                  child: SearchableDropdown.single(
                    iconSize: 20,
                    value: value,
                    items: items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: context.medium14TextMain),
                      );
                    }).toList(),
                    closeButton: tr.close,
                    style: context.medium14TextMain,
                    hint: hintText ?? '${tr.pleaseSelect} $label',
                    searchHint: tr.searchAndSelect,
                    onChanged: onChanged,
                    isExpanded: true,
                  ),
                ),
        ),
      ],
    );
  }
}
