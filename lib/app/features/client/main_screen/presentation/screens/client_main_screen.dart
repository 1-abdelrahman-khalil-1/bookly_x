import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/features/client/main_screen/presentation/screens/controller/main_cubit.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

@RoutePage()
class ClientMainScreen extends StatelessWidget {
  const ClientMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, int>(builder: (context, state) {
        final cubit = context.read<MainCubit>();
        return Scaffold(
            body: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: cubit.pages[state]),
            // glass effect
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textBorders.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
                border: Border(top: BorderSide(color: AppColors.textBorders)),
              ),
              child: SafeArea(
                child: GNav(
                  color: AppColors.textSub,
                  activeColor: AppColors.primary2,
                  tabBackgroundColor: AppColors.primary2,
                  textStyle: context.regular14White,
                  tabBorder: Border.all(color: AppColors.textPlaceholder),
                  gap: 8,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  selectedIndex: state,
                  onTabChange: (index) {
                    context.read<MainCubit>().changeIndex(index);
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
            ));
      }),
    );
  }
}
