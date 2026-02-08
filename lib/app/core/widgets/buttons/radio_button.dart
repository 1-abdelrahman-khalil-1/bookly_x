// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mastertip_mobile/app/core/widgets/buttons/custom_ink_well.dart';
// import 'package:mastertip_mobile/app/core/widgets/custom_sized_box.dart';
//
// class RadioButton extends StatelessWidget {
//   const RadioButton({
//     super.key,
//     required this.onTap,
//     required this.selectedIndex,
//     required this.index,
//     required this.child,
//   });
//
//   final Function(int index) onTap;
//   final int selectedIndex;
//   final int index;
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomInkWell(
//       onTap: () => onTap(index),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4.0),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               selectedIndex == index
//                   ? 'assets/icons/radio_selected.svg'
//                   : 'assets/icons/radio_unselected.svg',
//               width: 18,
//               height: 18,
//             ),
//             const Width(10),
//             Center(child: child),
//           ],
//         ),
//       ),
//     );
//   }
// }
