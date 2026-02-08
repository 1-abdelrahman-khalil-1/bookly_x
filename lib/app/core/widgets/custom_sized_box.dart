import 'package:flutter/material.dart';

extension NumExtension on num {
  Widget get h => SizedBox(height: toDouble());

  Widget get w => SizedBox(width: toDouble());
}

class Height extends StatelessWidget {
  const Height(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class Width extends StatelessWidget {
  const Width(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}
