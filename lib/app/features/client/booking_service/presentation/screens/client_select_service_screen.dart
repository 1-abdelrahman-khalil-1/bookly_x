import 'package:bookly_x/app/core/utils/show_message.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x/app/features/client/booking_service/presentation/controller/booking_flow_providers.dart';
import 'package:bookly_x/app/features/client/booking_service/presentation/widgets/client_service_card.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientSelectServiceView extends ConsumerWidget {
  final ValueChanged<BookingServiceModel> onNext;

  const ClientSelectServiceView({
    super.key,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = BookingServiceModel.mockServices;
    final selectedServiceId = ref.watch(bookingSelectedServiceIdProvider);

    return Column(
      children: [
        20.h,
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: services.length,
            separatorBuilder: (_, __) => 12.h,
            itemBuilder: (context, index) {
              final service = services[index];
              return ClientServiceCard(
                service: service,
                isSelected: selectedServiceId == service.id,
                onTap: () {
                  ref.read(bookingSelectedServiceIdProvider.notifier).state =
                      service.id;
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
              if (selectedServiceId == null) {
                setWarningMessage(tr.selectService);
                return;
              }
              onNext(
                services.firstWhere((s) => s.id == selectedServiceId),
              );
            },
          ),
        ),
      ],
    );
  }
}
