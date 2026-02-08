import 'package:flutter/material.dart';

import '/generated/style_atoms.dart';
import '../../../generated/translations.g.dart';
import '../enums/internet_status.dart';
import '../services/internet_connection_service.dart';
import '../themes/app_colors.dart';
import '../widgets/buttons/custom_button.dart';
import '../widgets/custom_sized_box.dart';

// ignore: must_be_immutable
class NoInternetScreen extends StatefulWidget {
  NoInternetScreen({super.key, required this.isLoading, required this.onRetry});

  final VoidCallback onRetry;
  bool isLoading;

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  void initState() {
    InternetConnectionService.event.on<ConnectionStatus>().listen((event) {
      if (event == ConnectionStatus.connected) widget.onRetry();
    });
    super.initState();
  }

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
              const Expanded(flex: 3, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
