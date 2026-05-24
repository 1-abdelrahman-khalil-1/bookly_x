import 'dart:developer';

import 'package:flutter/material.dart';

/// Widget that enables resetting app state by remounting its child tree.
class AppRestarter extends StatefulWidget {
  final WidgetBuilder builder;
  final VoidCallback? onRestart;

  const AppRestarter({super.key, required this.builder, this.onRestart});

  /// Global key to access the AppRestarterState from anywhere without context.
  static final GlobalKey<AppRestarterState> stateKey =
      GlobalKey<AppRestarterState>();

  /// Remounts the app subtree so providers and widget state can be recreated.
  static void restart([BuildContext? context]) {
    final state = context != null
        ? context.findAncestorStateOfType<AppRestarterState>()
        : stateKey.currentState;

    if (state != null) {
      log('Resetting app state (Key switch)...', name: 'AppRestarter');
      state.softRestart();
    } else {
      log('AppRestarter state is not available.', name: 'AppRestarter');
    }
  }

  @override
  State<AppRestarter> createState() => AppRestarterState();
}

class AppRestarterState extends State<AppRestarter> {
  Key _key = UniqueKey();

  void softRestart() {
    widget.onRestart?.call();

    if (!mounted) return;
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.builder(context),
    );
  }
}
