import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

/// Widget that enables app restart.
/// It supports "Soft Restart" (rebuilding the widget tree) for better UX,
/// and falls back to "Hard Restart" (native process restart) via the restart_app package.
class AppRestarter extends StatefulWidget {
  final Widget child;
  final VoidCallback? onRestart;

  const AppRestarter({super.key, required this.child, this.onRestart});

  /// Global key to access the AppRestarterState from anywhere without context.
  static final GlobalKey<AppRestarterState> stateKey = GlobalKey<AppRestarterState>();

  /// Performs an app restart.
  /// If [context] is provided or the global state is available, it performs a "Soft Restart"
  /// by changing the widget tree key, which is faster and smoother.
  /// Otherwise, it performs a "Hard Restart" using the native platform plugin.
  static void restart([BuildContext? context]) {
    final state = context != null
        ? context.findAncestorStateOfType<AppRestarterState>()
        : stateKey.currentState;

    if (state != null) {
      log('Performing soft restart (Key switch)...', name: 'AppRestarter');
      state.softRestart();
    } else {
      log('Performing hard restart (Native plugin)...', name: 'AppRestarter');
      Restart.restartApp();
    }
  }

  @override
  State<AppRestarter> createState() => AppRestarterState();
}

class AppRestarterState extends State<AppRestarter> {
  Key _key = UniqueKey();

  void softRestart() {
    if (widget.onRestart != null) {
      widget.onRestart!();
    }
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
