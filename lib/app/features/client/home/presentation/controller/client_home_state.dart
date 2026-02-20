part of 'client_home_cubit.dart';

enum RequestStatus { initial, loading, success, failure }

class ClientHomeState extends Equatable {
  final RequestStatus offersStatus;
  final RequestStatus providersStatus;
  final List<OfferModel> offers;
  final List<ProviderModel> providers;
  final String selectedCategoryId;

  const ClientHomeState({
    this.offersStatus = RequestStatus.initial,
    this.providersStatus = RequestStatus.initial,
    this.offers = const [],
    this.providers = const [],
    this.selectedCategoryId = '1',
  });

  ClientHomeState copyWith({
    RequestStatus? offersStatus,
    RequestStatus? providersStatus,
    List<OfferModel>? offers,
    List<ProviderModel>? providers,
    String? selectedCategoryId,
  }) {
    return ClientHomeState(
      offersStatus: offersStatus ?? this.offersStatus,
      providersStatus: providersStatus ?? this.providersStatus,
      offers: offers ?? this.offers,
      providers: providers ?? this.providers,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }

  @override
  List<Object?> get props => [
        offersStatus,
        providersStatus,
        offers,
        providers,
        selectedCategoryId,
      ];
}
