// import 'dart:math';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:mastertip_mobile/app/core/widgets/hero/custom_hero.dart';
//
// class HeroText extends StatelessWidget {
//   const HeroText(
//     this.text, {
//     super.key,
//     this.style,
//     this.tag,
//   });
//
//   final String text;
//   final TextStyle? style;
//   final String? tag;
//
//   @override
//   Widget build(BuildContext context) {
//     return (tag ?? text).isNotEmpty
//         ? CustomHero(
//             tag: (tag ?? text) +
//                 (kDebugMode ? Random().nextInt(10000000).toString() : ''),
//             child: Text(text, style: style),
//           )
//         : Text(text, style: style);
//   }
// }
