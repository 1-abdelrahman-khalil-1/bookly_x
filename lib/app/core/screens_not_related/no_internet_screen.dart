import 'dart:async';

import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoInternetScreen extends StatefulWidget {
  NoInternetScreen({super.key, required this.isLoading, required this.onRetry});

  final VoidCallback onRetry;
  bool isLoading;

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    // _subscription =
    //     InternetConnectionService.event.on<ConnectionStatus>().listen((event) {
    //   if (event == ConnectionStatus.connected) widget.onRetry();
    // });
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.wifi_off_rounded,
          size: 100,
          color: AppColors.primary,
        ),
        const Height(16),
        Text(tr.noInternet, style: context.regular18Primary),
        const Height(8),
        Text(tr.checkInternetConnection, style: context.light14TextMain),
        const Height(24),
        CustomButton(
          title: tr.tryAgain,
          onPress: () {
            widget.isLoading = true;
            setState(() {});
            widget.onRetry();
          },
          isLoading: widget.isLoading,
        ),
      ],
    );
  }
}
