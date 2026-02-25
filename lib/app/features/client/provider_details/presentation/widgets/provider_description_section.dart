import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

/// Description block with "Read more" inline link.
class ProviderDescriptionSection extends StatefulWidget {
  const ProviderDescriptionSection({
    super.key,
    required this.description,
    this.maxLines = 3,
  });

  final String description;
  final int maxLines;

  @override
  State<ProviderDescriptionSection> createState() =>
      _ProviderDescriptionSectionState();
}

class _ProviderDescriptionSectionState
    extends State<ProviderDescriptionSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.description, style: context.medium16Black),
        8.h,
        Text(
          widget.description,
          style: context.light12TextSub,
          maxLines: _expanded ? null : widget.maxLines,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        4.h,
        if (!_expanded)
          GestureDetector(
            onTap: () => setState(() => _expanded = true),
            child: Text(
              tr.readMore,
              style: context.regular12.primary,
            ),
          ),
      ],
    );
  }
}
