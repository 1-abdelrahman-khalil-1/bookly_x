import 'package:bookly_x_client/app/features/client/home/presentation/controller/client_home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// Setup all dependencies for the app
void setupServiceLocator() {
  getIt.registerSingleton<ClientHomeCubit>(ClientHomeCubit());
}
