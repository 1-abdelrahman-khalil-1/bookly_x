import 'package:bookly_x_client/app/core/mixins/internet_error_handler_mixin.dart';
import 'package:bookly_x_client/app/core/models/general_state.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_availability_model.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/services/staff_profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staffAvailabilityNotifierProvider =
    StateNotifierProvider<StaffAvailabilityNotifier, GeneralState<void>>(
  (ref) => StaffAvailabilityNotifier(ref.read(staffProfileServiceProvider)),
);

class StaffAvailabilityNotifier extends StateNotifier<GeneralState<void>>
    with InternetErrorHandlerMixin<void> {
  StaffAvailabilityNotifier(this._staffProfileService)
      : super(const GeneralState());

  final StaffProfileService _staffProfileService;

  Future<bool> saveAvailabilities({
    required List<StaffAvailabilityModel> currentAvailabilities,
    required List<StaffAvailabilityModel> draftAvailabilities,
  }) {
    return executeVoid(() async {
      final currentById = {
        for (final availability in currentAvailabilities)
          availability.id: availability,
      };

      final draftIds = draftAvailabilities
          .map((availability) => availability.id)
          .where((id) => id > 0)
          .toSet();

      for (final current in currentAvailabilities) {
        if (current.id > 0 && !draftIds.contains(current.id)) {
          await _staffProfileService.deleteAvailability(current.id);
        }
      }

      for (final draft in draftAvailabilities) {
        if (draft.id > 0) {
          final original = currentById[draft.id];
          if (original == null ||
              original.dayOfWeek != draft.dayOfWeek ||
              original.startTime != draft.startTime ||
              original.endTime != draft.endTime) {
            await _staffProfileService.updateAvailability(
              availabilityId: draft.id,
              dayOfWeek: draft.dayOfWeek,
              startTime: draft.startTime,
              endTime: draft.endTime,
            );
          }
          continue;
        }
        await _staffProfileService.createAvailability(
          dayOfWeek: draft.dayOfWeek,
          startTime: draft.startTime,
          endTime: draft.endTime,
        );
      }
    });
  }
}
