import 'package:flutter/material.dart';

extension ModalRouteExtensions on ModalRoute {
  PageRouteBuilder get withoutAnimation =>
      PageRouteBuilder(pageBuilder: buildPage);
}
