import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary2,
              blurRadius: 24,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
