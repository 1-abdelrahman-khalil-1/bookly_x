import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_review_model.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/services/staff_profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staffReviewsFutureProvider = FutureProvider<List<StaffReviewModel>>(
  (ref) => ref.watch(staffProfileServiceProvider).getStaffReviews(),
);
