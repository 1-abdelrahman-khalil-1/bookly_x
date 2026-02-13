import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/widgets/logo_name.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StaffMainScreen extends StatelessWidget {
  const StaffMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LogoName(),
        ],
      ),
    );
  }
}
