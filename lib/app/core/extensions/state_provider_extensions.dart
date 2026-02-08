import 'package:flutter_riverpod/flutter_riverpod.dart';

extension StateProviderExtensions<T> on StateProvider<T> {
  void emit(Ref ref, T newState) {
    ref.read(notifier).state = newState;
  }

  T value(Ref ref) {
    return ref.watch(notifier).state;
  }
}
