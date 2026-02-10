import 'package:auto_route/annotations.dart';
import 'package:bookly_x_client/generated/assets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.pngBackGround,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            Assets.pngLogo,
          ),
        ),
      ),
    );
  }
}
