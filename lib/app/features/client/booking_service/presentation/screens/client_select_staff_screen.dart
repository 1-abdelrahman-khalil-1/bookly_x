import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/utils/show_message.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x/app/features/client/booking_service/presentation/controller/booking_flow_providers.dart';
import 'package:bookly_x/app/features/client/booking_service/presentation/widgets/client_staff_card.dart';
import 'package:bookly_x/generated/style_atoms.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:bookly_x/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientSelectStaffView extends ConsumerWidget {
  final BookingServiceModel selectedService;
  final ValueChanged<StaffModel> onNext;

  const ClientSelectStaffView({
    super.key,
    required this.selectedService,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffList = StaffModel.mockStaff;
    final selectedStaffId = ref.watch(bookingSelectedStaffIdProvider);

    return Column(
      children: [
        20.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(tr.selectStaff, style: context.semiBold16TextMain),
          ),
        ),
        12.h,
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: staffList.length,
            separatorBuilder: (_, __) => 12.h,
            itemBuilder: (context, index) {
              final staff = staffList[index];
              return ClientStaffCard(
                staff: staff,
                isSelected: selectedStaffId == staff.id,
                onTap: () {
                  ref.read(bookingSelectedStaffIdProvider.notifier).state =
                      staff.id;
                },
                onInfoTap: () {
                  context.pushRoute(ClientStaffInfoRoute(staff: staff));
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomButton(
            title: tr.next,
            onPress: () {
              if (selectedStaffId == null) {
                setWarningMessage(tr.selectStaff);
                return;
              }
              onNext(
                staffList.firstWhere((s) => s.id == selectedStaffId),
              );
            },
          ),
        ),
      ],
    );
  }
}
