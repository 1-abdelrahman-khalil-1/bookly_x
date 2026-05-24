import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_pagination.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/controllers/staff_reviews_future_provider.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_review_card.dart';
import 'package:bookly_x_client/app/features/staff/profile/presentation/widgets/staff_reviews_shimmer.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class StaffReviewsScreen extends ConsumerWidget {
  const StaffReviewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppbar(title: tr.reviews),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomPagination(
            provider: staffReviewsProviderPagination,
            loadingBuilder: (context, controller) =>
                const StaffReviewsShimmer(),
            itemBuilder: (context, review, index) {
              return StaffReviewCard(review: review);
            },
            noItemsFoundIndicatorBuilder: (context, controller) {
              return Center(
                child: Text(tr.noResultsFound, style: context.regular14TextSub),
              );
            },
          ),
        ),
      ),
    );
  }
}
