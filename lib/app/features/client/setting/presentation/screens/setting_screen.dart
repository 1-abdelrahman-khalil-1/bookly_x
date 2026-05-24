import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/data/lang_pref.dart';
import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/services/session_reset_service.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/custom_transform_arabic.dart';
import 'package:bookly_x_client/app/core/widgets/images/custom_upload_image.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/main.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            // header
            Row(
              children: [
                const CustomUploadImage(
                  initImageUrl:
                      'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  isCircular: true,
                  profileSize: 60,
                  iconSize: 12,
                  iconBgColor: AppColors.textBorders,
                ),
                16.w,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Body Badr",
                      style: context.semiBold16,
                    ),
                    Text(
                      "bodybadr@gmail.com",
                      style: context.regular14TextSub,
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => context.push(const ClientEditProfileRoute()),
                  child: Column(
                    children: [
                      const Icon(
                        MyIcons.edit2Outline,
                        color: AppColors.textSub,
                        size: 20,
                      ),
                      4.h,
                      Text(tr.editProfile, style: context.regular12TextSub),
                    ],
                  ),
                ),
              ],
            ),
            16.h,
            //notifications
            _buildItem(
              context,
              icon: MyIcons.notificationBingOutline,
              title: tr.notifications,
              subTitle: tr.manageNotificationPreferences,
              onTap: () {
                context.push(const ClientNotificationPreferencesRoute());
              },
            ),
            // favoirtes
            _buildItem(
              context,
              icon: MyIcons.heartOutline,
              title: tr.favorites,
              subTitle: tr.manageFavorites,
              onTap: () {
                context.push(const ClientManagePreferencesRoute());
              },
            ),
            //privacy
            _buildItem(
              context,
              icon: MyIcons.securitySafeOutline,
              title: tr.privacyAndSecurity,
              subTitle: tr.managePrivacySettings,
              onTap: () {
                context.push(const ClientPrivacySecurityRoute());
              },
            ),
            //language
            _buildItem(
              context,
              icon: MyIcons.languageCircleOutline,
              title: tr.language,
              subTitle: tr.chooseYourPreferredLanguage,
              onTap: () {
                final lang = LangPrefs();
                context.showBottomSheet(
                    bottomSheetBody: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        isArabic ? Icons.check_circle : Icons.circle_outlined,
                        color: isArabic ? AppColors.primary : AppColors.textSub,
                      ),
                      title: const Text("العربية"),
                      onTap: () {
                        lang.setLangToArabic();
                        globalRefContainer.invalidate(langPrefsProvider);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        !isArabic ? Icons.check_circle : Icons.circle_outlined,
                        color:
                            !isArabic ? AppColors.primary : AppColors.textSub,
                      ),
                      title: const Text("English"),
                      onTap: () {
                        lang.setLangToEnglish();
                        globalRefContainer.invalidate(langPrefsProvider);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ));
              },
            ),

            //invite friends
            _buildItem(
              context,
              icon: MyIcons.shareOutline,
              title: tr.inviteFriends,
              subTitle: tr.inviteYourFriendsToJoinOurApp,
              onTap: () {
                setWarningMessage(tr.thisFeatureIsComingSoon);
              },
            ),
            16.h,
            //logout
            GestureDetector(
              onTap: () async {
                await SessionResetService.logoutAndReset();
                setSuccessfullyMessage(tr.logoutSuccessfully);
              },
              child: Row(
                children: [
                  const CustomTransformArabic(
                    transformInArabic: false,
                    child: Icon(MyIcons.logoutOutline,
                        color: AppColors.textSub, size: 20),
                  ),
                  16.w,
                  Text(tr.logOut, style: context.semiBold16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subTitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.textSub),
            ),
            child: Icon(icon, color: AppColors.textSub),
          ),
          16.w,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.semiBold16),
              Text(subTitle, style: context.regular14TextSub),
            ],
          ),
          const Spacer(),
          const CustomTransformArabic(
              child: Icon(MyIcons.arrowRightOutline,
                  color: AppColors.textSub, size: 20)),
        ],
      ),
    );
  }
}
