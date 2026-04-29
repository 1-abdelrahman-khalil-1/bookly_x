import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/features/staff/alerts/presentation/screens/alerts_screen.dart';
import 'package:bookly_x_client/app/features/staff/schedule/presentation/screens/staff_schedule_screen.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

final staffSelectedTabProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class StaffMainScreen extends ConsumerWidget {
  const StaffMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(staffSelectedTabProvider);
    final pages = [
      const StaffScheduleScreen(),
      const AlertsScreen(),
      Scaffold(
          body: Center(child: Text(tr.income, style: context.bold18Primary))),
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
          child: pages[selectedIndex]),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
            border: const Border(top: BorderSide(color: AppColors.textBorders)),
          ),
          child: GNav(
            color: AppColors.textSub,
            activeColor: AppColors.dodgerBlue,
            tabBackgroundColor: AppColors.dodgerBlue.withValues(alpha: 0.1),
            textStyle: context.bold14Primary,
            tabBorder: Border.all(color: Colors.transparent),
            gap: 8,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              ref.read(staffSelectedTabProvider.notifier).state = index;
            },
            tabs: [
              GButton(
                icon: MyIcons.calendarOutline,
                text: tr.schedule,
                iconActiveColor: AppColors.dodgerBlue,
              ),
              GButton(
                icon: MyIcons.notificationOutline,
                text: tr.alerts,
                iconActiveColor: AppColors.dodgerBlue,
              ),
              GButton(
                icon: MyIcons.moneyOutline,
                text: tr.income,
                iconActiveColor: AppColors.dodgerBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
