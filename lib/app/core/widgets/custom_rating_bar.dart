import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBarIndicator extends StatefulWidget {
  const CustomRatingBarIndicator({
    super.key,
    this.rating = 0,
    this.itemSize = 12.0,
    this.itemCount = 5,
    this.height = 20,
    this.updateOnDrag,
    this.ignoreGestures,
    this.onRatingUpdate,
    this.allowHalfRating = false,
  });

  final num rating;
  final double itemSize;
  final double height;
  final int itemCount;
  final bool? updateOnDrag;
  final bool? ignoreGestures;
  final bool allowHalfRating;
  final ValueChanged<double>? onRatingUpdate;

  @override
  State<CustomRatingBarIndicator> createState() =>
      _CustomRatingBarIndicatorState();
}

class _CustomRatingBarIndicatorState extends State<CustomRatingBarIndicator> {
  late num rating;

  @override
  void initState() {
    rating = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          width: widget.itemSize * widget.itemCount,
          child: RatingBar.builder(
            initialRating: widget.rating.toDouble(),
            itemCount: widget.itemCount,
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Icon(
                MyIcons.star,
                color: AppColors.primaryLight,
                size: widget.itemSize,
              ),
            ),
            itemSize: widget.itemSize,
            unratedColor: AppColors.textSub,
            glow: false,
            ignoreGestures: widget.ignoreGestures ?? true,
            allowHalfRating: widget.allowHalfRating,
            onRatingUpdate: (newRating) {
              setState(() {
                rating = newRating;
                widget.onRatingUpdate?.call(newRating);
              });
            },
            updateOnDrag: widget.updateOnDrag ?? false,
          ),
        ),
      ],
    );
  }
}
