import 'dart:io';
import 'package:bookly_x/app/core/mixins/internet_error_handler_mixin.dart';
import 'package:bookly_x/app/core/models/general_state.dart';
import 'package:bookly_x/app/core/models/user_model.dart';
import 'package:bookly_x/app/features/client/setting/data/service/setting_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------------------------------------------------------------------
// Client Profile Provider
// ---------------------------------------------------------------------------
final clientProfileFutureProvider = FutureProvider<UserModel>((ref) async {
  final service = ref.watch(settingServiceProvider);
  return service.getProfile();
});

// ---------------------------------------------------------------------------
// Client Edit Profile Notifier
// ---------------------------------------------------------------------------
final clientEditProfileNotifierProvider =
    StateNotifierProvider<ClientEditProfileNotifier, GeneralState<void>>((ref) {
  return ClientEditProfileNotifier(
    ref.watch(settingServiceProvider),
    ref,
  );
});

class ClientEditProfileNotifier extends StateNotifier<GeneralState<void>>
    with InternetErrorHandlerMixin<void> {
  ClientEditProfileNotifier(this._settingService, this._ref)
      : super(const GeneralState());

  final SettingService _settingService;
  final Ref _ref;

  Future<bool> updateProfile({
    required String name,
    File? imageFile,
  }) async {
    return await executeVoid(() async {
      await _settingService.updateProfile(
        name: name,
        profileImage: imageFile,
      );

      // Invalidate profile and dashboard so header and other places refresh
      _ref.invalidate(clientProfileFutureProvider);
    });
  }
}
