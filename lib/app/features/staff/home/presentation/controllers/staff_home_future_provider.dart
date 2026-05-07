import 'package:bookly_x_client/app/features/staff/home/data/models/appoitment_model.dart';
import 'package:bookly_x_client/app/features/staff/home/data/service/staff_home_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider<DateTime>((_) => DateTime.now());

final staffHomeFutureProvider =
    FutureProvider<List<AppoitmentModel>>((ref) async {
  final selectedDate = ref.watch(selectedDateProvider);
  return await ref.watch(staffHomeServiceProvider).getSchedule(selectedDate);
});
