import 'package:bookly_x/app/core/extensions/context_extensions.dart';
import 'package:bookly_x/app/core/screens_not_related/future_provider_screen.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_search.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x/app/features/client/setting/presentation/controllers/client_setting_future_providers.dart';
import 'package:bookly_x/generated/my_icons.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class ClientHeaderSection extends ConsumerWidget {
  const ClientHeaderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          // Profile, Greeting, and Notification
          ref.watchWhen(
            provider: clientProfileFutureProvider,
            loading: () => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  16.w,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                          width: 80,
                          color: Colors.white,
                        ),
                        6.h,
                        Container(
                          height: 16,
                          width: 120,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 44,
                    width: 44,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            data: (user) {
              final String? profileImageUrl = user.client?.profileImageUrl;
              final String displayName = user.name.isNotEmpty ? user.name : 'Client';

              return Row(
                children: [
                  // Profile Image
                  CustomCachedNetworkImage(
                    imgUrl: profileImageUrl ??
                        'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    height: 50,
                    width: 50,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  16.w,
                  // Greeting Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.goodMorning,
                          style: context.regular12TextSub,
                        ),
                        4.h,
                        Text(
                          displayName,
                          style: context.semiBold16Black,
                        ),
                      ],
                    ),
                  ),
                  // Notification Bell with Badge
                  InkWell(
                    onTap: () {
                      context.push(const NotificationsRoute());
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.textBorders),
                          ),
                          child: const Icon(
                            MyIcons.notificationBingOutline,
                            color: AppColors.textMain,
                            size: 24,
                          ),
                        ),
                        Badge.count(
                          count: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          16.h,
          // Search Bar
          CustomSearch(
            onSelected: (value) {},
            suggestionsCallback: null,
          ),
        ],
      ),
    );
  }
}
