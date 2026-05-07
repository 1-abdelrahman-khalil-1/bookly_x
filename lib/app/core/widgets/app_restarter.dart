import 'dart:developer';

import 'package:flutter/material.dart';

/// Global reference to AppRestarterState for manual restart
AppRestarterState? _appRestarterState;

/// Widget that enables app restart by changing its key
/// This forces Flutter to dispose and rebuild the entire subtree,
/// which creates a fresh ProviderContainer
class AppRestarter extends StatefulWidget {
  final Widget child;

  const AppRestarter({super.key, required this.child});

  /// Restart the app by triggering a rebuild with a new key
  /// This disposes all providers and creates a fresh ProviderContainer
  static void restart() {
    log('Restarting app...', name: 'AppRestarter');
    _appRestarterState?._restartApp();
  }

  @override
  State<AppRestarter> createState() => AppRestarterState();
}

class AppRestarterState extends State<AppRestarter> {
  UniqueKey _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    _appRestarterState = this;
  }

  void _restartApp() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.child,
    );
  }
}
