import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ServerErrorScreen extends StatefulWidget {
  ServerErrorScreen({
    super.key,
    required this.isLoading,
    required this.onRetry,
  });

  late bool isLoading;
  final VoidCallback onRetry;

  @override
  _ServerErrorState createState() => _ServerErrorState();
}

class _ServerErrorState extends State<ServerErrorScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              const Icon(
                MyIcons.warning2Outline,
                size: 64,
                color: AppColors.danger,
              ),
              const Height(24),
              Text(tr.aServerErrorOccurred, style: context.regular18Primary),
              const Height(8),
              Text(
                tr.somethingWentWrongWithTheServerPleaseTryAgainLater,
                textAlign: TextAlign.center,
                style: context.light14TextMain,
              ),
              const Height(24),
              CustomButton(
                title: tr.tryAgain,
                onPress: () {
                  widget.isLoading = true;
                  setState(() {});
                  widget.onRetry();
                },
                isLoading: widget.isLoading,
                width: 165.5,
              ),
              const Expanded(flex: 3, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
