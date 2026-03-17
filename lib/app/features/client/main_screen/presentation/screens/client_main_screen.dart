import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/map_screen.dart';
import 'package:bookly_x_client/app/features/client/bookings/presentation/screens/bookings_screen.dart';
import 'package:bookly_x_client/app/features/client/home/presentation/screens/client_home_screen.dart';
import 'package:bookly_x_client/app/features/client/main_screen/presentation/controller/main_providers.dart';
import 'package:bookly_x_client/app/features/client/offers/presentation/screens/offers_screen.dart';
import 'package:bookly_x_client/app/features/client/setting/presentation/screens/setting_screen.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:map_location_picker/map_location_picker.dart';

@RoutePage()
class ClientMainScreen extends ConsumerWidget {
  const ClientMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedTabProvider);
    final pages = [
      const ClientHomeScreen(),
      MapScreen(
        currentLatLng: const LatLng(30.1360, 31.7150),
        onLocationSelected: (latLng, address) {},
      ),
      const BookingsScreen(),
      const OffersScreen(),
      const SettingScreen(),
    ];
    return Scaffold(
      body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: SafeArea(child: pages[selectedIndex])),
      // glass effect
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.textBorders.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
            border: const Border(top: BorderSide(color: AppColors.textBorders)),
          ),
          child: SafeArea(
            child: GNav(
              color: AppColors.textSub,
              activeColor: AppColors.primary2,
              tabBackgroundColor: AppColors.primary2,
              textStyle: context.regular14White,
              tabBorder: Border.all(color: AppColors.textPlaceholder),
              gap: 8,
              padding: const EdgeInsets.all(12),
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                ref.read(selectedTabProvider.notifier).state = index;
              },
              tabs: [
                GButton(
                  icon: MyIcons.homeBold,
                  text: tr.home,
                  iconActiveColor: AppColors.white,
                ),
                GButton(
                  icon: Icons.explore_outlined,
                  text: tr.explore,
                  iconActiveColor: AppColors.white,
                ),
                GButton(
                  icon: Icons.shopping_basket_outlined,
                  text: tr.bookings,
                  iconActiveColor: AppColors.white,
                ),
                GButton(
                  icon: MyIcons.discountShapeBold,
                  text: tr.offers,
                  iconActiveColor: AppColors.white,
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: tr.settings,
                  iconActiveColor: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
