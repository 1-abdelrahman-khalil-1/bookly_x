// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../generated/translations.g.dart';

// @RoutePage()
// class ImageViewerScreen extends StatefulWidget {
//   const ImageViewerScreen({
//     super.key,
//     required this.image,
//     this.initialIndex = 0,
//   });
//   final int initialIndex;
//   final List<String> image;

//   @override
//   State<ImageViewerScreen> createState() => _ImageViewerScreenState();
// }

// class _ImageViewerScreenState extends State<ImageViewerScreen> {
//   int curIndex = -1;
//   late String curLink;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     curIndex = widget.initialIndex;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final arguments = widget.image;
//     return Scaffold(
//       appBar: CustomAppbar(title: tr.gallery),
//       body: Stack(
//         children: [
//           Container(
//             color: AppColors.white,
//             width: context.width,
//             height: context.height,
//             child: AnimatedSwitcher(
//               duration: const Duration(milliseconds: 400),
//               transitionBuilder: (child, animation) => FadeTransition(
//                 opacity: animation,
//                 child: SizedBox.expand(child: child),
//               ),
//               child: InteractiveViewer(
//                 key: Key(curIndex.toString()),
//                 minScale: 0.1,
//                 maxScale: 5.0,
//                 child: CustomCachedNetworkImage(
//                   imgUrl: widget.image[curIndex],
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   if (curIndex != 0)
//                     CustomInkWell(
//                       onTap: () {
//                         if (curIndex > 0) {
//                           curIndex--;
//                           setState(() {});
//                         }
//                       },
//                       child: Container(
//                         height: 32,
//                         width: 32,
//                         decoration: BoxDecoration(
//                           color: AppColors.black.withOpacity(.35),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(5)),
//                         ),
//                         padding: const EdgeInsets.all(4),
//                         child: CustomTransformArabic(
//                           transformInArabic: false,
//                           child: SizedBox(
//                             height: 26,
//                             width: 26,
//                             child: SvgPicture.asset(Assets.iconsArrowRight),
//                           ),
//                         ),
//                       ),
//                     ),
//                   const Spacer(),
//                   if (curIndex < arguments.length - 1)
//                     CustomInkWell(
//                       onTap: () {
//                         if (curIndex < arguments.length - 1) {
//                           curIndex++;
//                           setState(() {});
//                         }
//                       },
//                       child: Container(
//                         height: 32,
//                         width: 32,
//                         decoration: BoxDecoration(
//                           color: AppColors.black.withOpacity(.35),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(5)),
//                         ),
//                         padding: const EdgeInsets.all(4),
//                         child: CustomTransformArabic(
//                           child: SizedBox(
//                             height: 26,
//                             width: 26,
//                             child: SvgPicture.asset(Assets.iconsArrowRight),
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
