import 'package:bookly_x_client/app/features/staff/profile/data/model/staff_review_model.dart';
import 'package:bookly_x_client/app/features/staff/profile/data/services/staff_profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

final staffReviewsProviderPagination = StateNotifierProvider<
    StaffReviewsPagination, PagedState<int, StaffReviewModel>>(
  (ref) => StaffReviewsPagination(ref.watch(staffProfileServiceProvider)),
);

class StaffReviewsPagination extends PagedNotifier<int, StaffReviewModel> {
  final StaffProfileService service;
  StaffReviewsPagination(this.service)
      : super(
          load: (page, limit) async {
            return await service.getStaffReviews(
              page: page,
              limit: limit,
            );
          },
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
}
