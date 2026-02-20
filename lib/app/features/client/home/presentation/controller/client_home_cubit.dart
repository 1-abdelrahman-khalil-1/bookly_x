import 'package:bookly_x_client/app/core/api_helper/exceptions.dart';
import 'package:bookly_x_client/app/core/services/internet_error_service.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/app/features/client/home/data/models/provider_model.dart';
import 'package:bookly_x_client/app/features/client/offers/data/model/offer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_home_state.dart';

class ClientHomeCubit extends Cubit<ClientHomeState> {
  ClientHomeCubit() : super(const ClientHomeState());

  Future<void> loadData() async {
    await Future.wait([
      _fetchOffers(),
      _fetchProviders(),
    ]);
  }

  Future<void> _fetchOffers() async {
    emit(state.copyWith(offersStatus: RequestStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(
        offersStatus: RequestStatus.success,
        offers: offers,
      ));
    } on ApiException catch (e) {
      setErrorMessage(e.toString());
      emit(state.copyWith(offersStatus: RequestStatus.failure));
    } catch (e) {
      if (InternetErrorService.handleException(e)) return;
      setErrorMessage(e.toString());
      emit(state.copyWith(offersStatus: RequestStatus.failure));
    }
  }

  Future<void> _fetchProviders() async {
    emit(state.copyWith(providersStatus: RequestStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 1));
      final filtered = providers
          .where((p) => p.category.id == state.selectedCategoryId)
          .toList();
      emit(state.copyWith(
        providersStatus: RequestStatus.success,
        providers: filtered,
      ));
    } catch (e) {
      if (InternetErrorService.handleException(e)) return;
      emit(state.copyWith(providersStatus: RequestStatus.failure));
    }
  }

  void selectCategory(String categoryId) {
    emit(state.copyWith(selectedCategoryId: categoryId));
    _fetchProviders();
  }
}
