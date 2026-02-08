//
// import 'package:edara_property_mobile/core/themes/app_theme.dart';
// import 'package:flutter/material.dart';
//
// extension WarningAlert on BuildContext {
//   Future warningAlert({
//     required String title,
//     required VoidCallback onTap,
//     Widget? imageWidget,
//     required String actionTitle,
//     required String fallBackTitle,
//   }) {
//     return showDialog(
//       context: this,
//       builder: (c) => Dialog(
//         insetPadding: const EdgeInsets.symmetric(horizontal: 20),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (imageWidget != null) ...[
//                 imageWidget,
//                 const Height( 10),
//               ],
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                 child: Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: AppTheme.appTextColor,
//                     fontSize: 16,
//                     height: 1.8,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   DefaultAppButton(
//                     width: 139,
//                     height: 40,
//                     title: actionTitle,
//                     buttonColor: AppColors.redColor,
//                     onPress: onTap,
//                     textStyle: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                     ),
//                   ),
//                   const Width(10),
//                   DefaultAppButton(
//                     width: 139,
//                     height: 40,
//                     title: fallBackTitle,
//                     buttonColor: Colors.transparent,
//                     textStyle: const TextStyle(
//                       color: AppTheme.disabledTextColor,
//                       fontSize: 14,
//                     ),
//                     onPress: () => Navigator.pop(this),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
