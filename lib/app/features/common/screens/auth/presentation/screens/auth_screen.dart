import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/auth_form.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/logo_name.dart';
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/widgets/login_section.dart';
import 'package:bookly_x_client/app/features/common/screens/auth/presentation/widgets/sign_up_section.dart';
import 'package:bookly_x_client/generated/assets.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: UserPrefs.isUserStaff ? 1 : 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: MediaQuery.of(context).padding.copyWith(bottom: 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.pngBackGround),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LogoName(),
                  24.h,
                  Text(
                    tr.getStarted,
                    style: context.bold30White,
                  ),
                  12.h,
                  Text(
                    tr.createAnAccountOrLogInToExploreAboutOurApp,
                    style: context.regular14White,
                  ),
                ],
              ),
            ),
            24.h,
            // Auth Form
            AuthForm(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    controller: _tabController,
                    unselectedLabelColor: AppColors.textSub,
                    labelStyle: context.bold16Black,
                    padding: EdgeInsets.all(8),
                    tabs: [
                      Tab(child: Text(tr.login)),
                      if (!UserPrefs.isUserStaff) Tab(child: Text(tr.signUp)),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      //  physics: const NeverScrollableScrollPhysics(),
                      children: [
                        LoginSection(),
                        if (!UserPrefs.isUserStaff)
                          SignUpSection(
                            onBackButtonPressed: () {
                              _tabController.animateTo(0);
                            },
                          ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
