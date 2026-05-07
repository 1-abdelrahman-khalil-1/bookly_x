import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x_client/app/features/client/booking_service/data/models/booking_service_model.dart';
import 'package:bookly_x_client/app/features/client/booking_service/presentation/controller/booking_flow_providers.dart';
import 'package:bookly_x_client/app/features/client/booking_service/presentation/screens/client_confirm_booking_screen.dart';
import 'package:bookly_x_client/app/features/client/booking_service/presentation/screens/client_select_date_time_view.dart';
import 'package:bookly_x_client/app/features/client/booking_service/presentation/screens/client_select_service_screen.dart';
import 'package:bookly_x_client/app/features/client/booking_service/presentation/screens/client_select_staff_screen.dart';
import 'package:bookly_x_client/app/features/client/booking_service/presentation/widgets/booking_step_indicator.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ClientBookingServiceHostScreen extends ConsumerStatefulWidget {
  const ClientBookingServiceHostScreen({super.key});

  @override
  ConsumerState<ClientBookingServiceHostScreen> createState() =>
      _ClientBookingServiceHostScreenState();
}

class _ClientBookingServiceHostScreenState
    extends ConsumerState<ClientBookingServiceHostScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    ref.read(bookingFlowDataProvider.notifier).state = const BookingFlowData();
    ref.read(bookingStepProvider.notifier).state = 0;
    ref.read(bookingSelectedServiceIdProvider.notifier).state = null;
    ref.read(bookingSelectedStaffIdProvider.notifier).state = null;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    final activeStepIndex = ref.read(bookingStepProvider);
    if (activeStepIndex < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      ref.read(bookingStepProvider.notifier).state = activeStepIndex + 1;
    }
  }

  void _goToPreviousPage() {
    final activeStepIndex = ref.read(bookingStepProvider);
    if (activeStepIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      ref.read(bookingStepProvider.notifier).state = activeStepIndex - 1;
    } else {
      AutoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final flowData = ref.watch(bookingFlowDataProvider);
    final activeStepIndex = ref.watch(bookingStepProvider);

    return Scaffold(
      appBar: CustomAppbar(
        title: tr.bookingServices,
        onBackPress: activeStepIndex == 0 ? null : _goToPreviousPage,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: BookingStepIndicator(
                activeStep: activeStepIndex + 1,
                steps: [tr.services, tr.person, tr.time, tr.confirm],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ClientSelectServiceView(
                    onNext: (service) {
                      ref.read(bookingFlowDataProvider.notifier).state =
                          flowData.copyWith(selectedService: service);
                      _goToNextPage();
                    },
                  ),
                  if (flowData.selectedService != null)
                    ClientSelectStaffView(
                      selectedService: flowData.selectedService!,
                      onNext: (staff) {
                        ref.read(bookingFlowDataProvider.notifier).state =
                            flowData.copyWith(selectedStaff: staff);
                        _goToNextPage();
                      },
                    )
                  else
                    const SizedBox.shrink(),
                  if (flowData.selectedStaff != null)
                    ClientSelectDateTimeView(
                      flowData: flowData,
                      onNext: (date, time) {
                        ref.read(bookingFlowDataProvider.notifier).state =
                            flowData.copyWith(
                          selectedDate: date,
                          selectedTime: time,
                          isAm: time.hour < 12,
                        );
                        _goToNextPage();
                      },
                    )
                  else
                    const SizedBox.shrink(),
                  ClientConfirmBookingView(
                    onConfirm: () {
                      context.pushRoute(
                        ClientBookingSuccessRoute(
                          flowData: ref.read(bookingFlowDataProvider),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
