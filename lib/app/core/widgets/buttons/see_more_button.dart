// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mastertip_mobile/app/core/styles/style_atoms.dart';
// import 'package:mastertip_mobile/app/core/themes/app_colors.dart';
// import 'package:mastertip_mobile/app/core/widgets/buttons/custom_ink_well.dart';
// import 'package:mastertip_mobile/app/core/widgets/custom_sized_box.dart';
// import 'package:mastertip_mobile/generated/translations.g.dart';
//
// class SeeMoreButton extends StatelessWidget {
//   const SeeMoreButton({
//     super.key,
//     required this.onTap,
//     required this.isLoading,
//   });
//
//   final void Function() onTap;
//   final bool isLoading;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40,
//       child: isLoading
//           ? Container(
//               margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//               width: double.infinity,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CupertinoActivityIndicator(
//                     color: AppColors.primary,
//                   ),
//                   const Width(8),
//                   Text(
//                     tr.loading,
//                     style: context.medium14Primary,
//                   ),
//                 ],
//               ),
//             )
//           : CustomInkWell(
//               onTap: onTap,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.keyboard_arrow_down,
//                     color: AppColors.primary,
//                   ),
//                   Text(
//                     tr.see_more,
//                     style: context.medium14Primary,
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
