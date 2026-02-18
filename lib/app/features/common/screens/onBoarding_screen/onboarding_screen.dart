import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/data/routing_pref.dart';
import 'package:bookly_x_client/app/core/widgets/logo_name.dart';
import 'package:bookly_x_client/app/features/common/screens/onBoarding_screen/widgets/onboarding_page_widget.dart';
import 'package:bookly_x_client/generated/assets.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> get _onboardingData => [
        {
          'image': Assets.pngDoctorOnboarding,
          'title': tr.onboarding.doctorTitle,
          'subtitle': tr.onboarding.doctorSubtitle,
        },
        {
          'image': Assets.pngBarberOnboarding,
          'title': tr.onboarding.barberTitle,
          'subtitle': tr.onboarding.barberSubtitle,
        },
        {
          'image': Assets.pngSpaOnboarding,
          'title': tr.onboarding.spaTitle,
          'subtitle': tr.onboarding.spaSubtitle,
        },
      ];

  void _onNext() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _onSkip();
    }
  }

  void _onSkip() {
    RoutingPrefs.markOnBoardingAsSeen();
    context.replaceRoute(const AuthRoute());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.pngBackGround),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header with logo and Skip button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LogoName(),
                    TextButton(
                      onPressed: _onSkip,
                      child: Text(
                        tr.skip,
                        style: context.bold16White,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    final data = _onboardingData[index];
                    return OnboardingPageWidget(
                      imagePath: data['image']!,
                      title: data['title']!,
                      subtitle: data['subtitle']!,
                      currentPage: _currentPage,
                      onNext: _onNext,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
