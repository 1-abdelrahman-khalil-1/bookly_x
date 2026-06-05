import 'package:bookly_x/app/core/widgets/buttons/custom_ink_well.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.onTap,
    this.isChecked = false,
    this.title = '',
  });

  final bool isChecked;
  final String title;

  // ignore: avoid_positional_boolean_parameters
  final void Function(bool val) onTap;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isBoxChecked = true;

  @override
  void initState() {
    isBoxChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.onTap(isBoxChecked);
        });
      },
      child: Row(
        children: [
          /// todo uncomment
          // Theme(
          //   data: ThemeData(
          //     checkboxTheme: CheckboxThemeData(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(3),
          //       ),
          //     ),
          //   ),
          //   child: isBoxChecked
          //       ? SvgPicture.asset(
          //           Assets.iconsCheckedBoxSelected,
          //           width: 24,
          //           height: 24,
          //         )
          //       : SvgPicture.asset(
          //           Assets.iconsCheckedBoxUnselected,
          //           width: 24,
          //           height: 24,
          //         ),
          // ),
          SizedBox(width: isBoxChecked ? 15 : 14),
          Column(
            children: [
              const Height(4),
              Text(widget.title, style: context.medium16Primary),
            ],
          ),
        ],
      ),
    );
  }
}
