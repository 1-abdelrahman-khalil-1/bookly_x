// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mastertip_mobile/app/core/themes/app_colors.dart';
// import 'package:mastertip_mobile/app/core/widgets/buttons/custom_ink_well.dart';
// import 'package:mastertip_mobile/app/core/widgets/custom_sized_box.dart';
// import 'package:mastertip_mobile/generated/assets.dart';
//
// class CustomGoogleButton extends StatelessWidget {
//   const CustomGoogleButton({
//     super.key,
//     required this.title,
//     required this.onPressed,
//   });
//
//   final String title;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomInkWell(
//       onTap: onPressed,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8.0),
//           border: Border.all(
//             color: AppColors.grayLightActive,
//             width: 1.0,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 Assets.iconsGoogle,
//                 height: 24.0,
//                 width: 24.0,
//               ),
//               const Width(18),
//               Center(
//                 child: Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: AppColors.grayDark,
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
