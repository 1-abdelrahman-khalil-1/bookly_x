import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/shimmer/booking_card_shimmer.dart';
import 'package:bookly_x/app/core/widgets/shimmer/shimmer_box.dart';
import 'package:bookly_x/app/features/staff/home/presentation/widgets/staff_home_header.dart';
import 'package:flutter/material.dart';

class StaffScheduleShimmer extends StatelessWidget {
  const StaffScheduleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StaffHomeHeader(),
        Expanded(
          child: ListView(
            children: [
              20.h,
              const ShimmerBox(
                  height: 32,
                  width: 100,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              12.h,
              SizedBox(
                height: 88,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  separatorBuilder: (_, __) => 10.w,
                  itemBuilder: (context, index) {
                    return const ShimmerBox(
                      height: 88,
                      width: 80,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    );
                  },
                ),
              ),
              24.h,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (_, __) => 20.h,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: BookingCardShimmer(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
