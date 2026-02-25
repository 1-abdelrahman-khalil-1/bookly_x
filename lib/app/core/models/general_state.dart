import '../../../generated/translations.g.dart';

class GeneralState<T> {
  final bool isLoading;
  final String? errorMessage;
  final dynamic data;

  const GeneralState({
    this.isLoading = false,
    this.errorMessage,
    this.data,
  });
  factory GeneralState.loading() {
    return const GeneralState(isLoading: true, errorMessage: null, data: null);
  }
  factory GeneralState.error(String? message) {
    return GeneralState(
        isLoading: false,
        errorMessage: message ?? tr.somethingWentWrong,
        data: null);
  }
  factory GeneralState.success(T? data) {
    return GeneralState(isLoading: false, errorMessage: null, data: data);
  }
}
