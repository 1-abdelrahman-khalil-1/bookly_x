import 'package:bookly_x_client/app/core/models/user_model.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/services/staff_profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staffProfileFutureProvider = FutureProvider<UserModel>((ref) async {
  return ref.watch(staffProfileServiceProvider).getProfile();
});
