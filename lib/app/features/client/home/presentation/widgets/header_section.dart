import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/custom_search.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_cached_network_image.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 16,
        right: 16,
        //  bottom: 16,
      ),
      child: Column(
        children: [
          // Profile, Greeting, and Notification
          Row(
            children: [
              // Profile Image
              CustomCachedNetworkImage(
                //men profile image
                imgUrl:
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
                      'Body badr',
                      style: context.semiBold16Black,
                    ),
                  ],
                ),
              ),
              // Notification Bell with Badge
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.textBorders),
                    ),
                    child: Icon(
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
            ],
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
