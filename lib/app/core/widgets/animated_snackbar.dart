import 'package:bookly_x/generated/style_atoms.dart';
import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../utils/show_message.dart';
import 'custom_sized_box.dart';

class AnimatedSnackBar extends StatefulWidget {
  const AnimatedSnackBar({
    super.key,
    required this.borderColor,
    required this.iconData,
    required this.iconColor,
    required this.message,
    required this.messageColor,
    required this.desc,
    required this.animatedColor,
    required this.lightAnimatedColor,
    required this.verticalColor,
  });

  final Color borderColor;
  final IconData iconData;
  final Color iconColor;
  final String message;
  final String desc;
  final Color messageColor;
  final Color animatedColor;
  final Color lightAnimatedColor;
  final Color verticalColor;

  @override
  State<AnimatedSnackBar> createState() => _AnimatedSnackBarState();
}

class _AnimatedSnackBarState extends State<AnimatedSnackBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 6),
          child: Container(
            height: 85,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(8),
                bottomEnd: Radius.circular(8),
              ),
              border: Border.all(color: widget.borderColor, width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(widget.iconData, size: 20, color: widget.iconColor),
                    const Width(8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.message,
                            maxLines: 2,
                            style: currContext.medium14.copyWith(
                              color: widget.messageColor,
                            ),
                          ),
                          if (widget.desc.isNotEmpty) ...[
                            const Height(4),
                            Text(
                              widget.desc,
                              style: currContext.light12Black.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            const Height(4),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                AlertBar(
                  valueColor: widget.animatedColor,
                  backgroundColor: widget.lightAnimatedColor,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 85,
          width: 6,
          color: widget.verticalColor,
          child: const SizedBox(),
        ),
      ],
    );
  }
}

class AlertBar extends StatefulWidget {
  const AlertBar({
    super.key,
    required this.valueColor,
    required this.backgroundColor,
  });

  final Color valueColor;
  final Color backgroundColor;

  @override
  State<AlertBar> createState() => _AlertBarState();
}

class _AlertBarState extends State<AlertBar> {
  int _counter = 4700;

  @override
  void initState() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 20));
      if (mounted) setState(() {});
      _counter -= 25;
      return _counter > -25;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _counter / 4700,
      backgroundColor: widget.backgroundColor,
      valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
    );
  }
}
