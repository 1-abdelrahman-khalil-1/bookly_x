import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x/app/features/client/booking_service/presentation/widgets/client_staff_info_header_section.dart';
import 'package:bookly_x/app/features/client/booking_service/presentation/widgets/client_staff_info_main_card_section.dart';
import 'package:bookly_x/app/features/client/booking_service/presentation/widgets/client_staff_info_tab_section.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ClientStaffInfoScreen extends StatefulWidget {
  final StaffModel staff;

  const ClientStaffInfoScreen({super.key, required this.staff});

  @override
  State<ClientStaffInfoScreen> createState() => _ClientStaffInfoScreenState();
}

class _ClientStaffInfoScreenState extends State<ClientStaffInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final staff = widget.staff;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: false,
            floating: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: ClientStaffInfoHeaderSection(staff: staff),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(color: AppColors.white),
              child: Column(
                children: [
                  ClientStaffInfoMainCardSection(staff: staff),
                  10.h,
                  ClientStaffInfoTabSection(
                    workPlaces: staff.workPlaces,
                    reviews: staff.reviews,
                  ),
                  20.h,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
