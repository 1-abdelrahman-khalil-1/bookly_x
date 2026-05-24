part of '../screens/staff_profile_screen.dart';

class StaffSettingSection extends StatelessWidget {
  const StaffSettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.settings, style: context.bold18Primary),
        12.h,
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.03),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildSettingsItem(
                context,
                icon: MyIcons.languageCircleOutline,
                title: tr.language,
                onTap: () => _showLanguageBottomSheet(context),
              ),
              const Divider(
                height: 32,
                color: AppColors.whiteCatskillWhite,
                thickness: 1,
              ),
              _buildSettingsItem(
                context,
                icon: MyIcons.securitySafeOutline,
                title: tr.privacyPolicy,
                onTap: () {
                  context.push(const ClientPrivacySecurityRoute());
                },
              ),
              const Divider(
                height: 32,
                color: AppColors.whiteCatskillWhite,
                thickness: 1,
              ),
              _buildSettingsItem(
                context,
                icon: MyIcons.logoutOutline,
                title: tr.logOut,
                titleColor: AppColors.danger,
                iconColor: AppColors.danger,
                showArrow: false,
                onTap: () async {
                  context.showCustomDialog(
                      content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tr.areYouSureYouWantToLogout,
                        style: context.bold16,
                      ),
                      16.h,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButtonOutlined(
                              title: tr.cancel,
                              buttonColor: AppColors.primaryLightHover,
                              onPress: () => ContextExtentions(context).pop(),
                            ),
                          ),
                          16.w,
                          Expanded(
                            child: CustomButton(
                              title: tr.confirm,
                              onPress: () async {
                                await SessionResetService.logoutAndReset();
                                setSuccessfullyMessage(tr.logoutSuccessfully);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? titleColor,
    Color? iconColor,
    bool showArrow = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (iconColor ?? AppColors.textSub).withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor ?? AppColors.textSub,
              size: 20,
            ),
          ),
          16.w,
          Text(
            title,
            style: context.semiBold16.copyWith(
              color: titleColor ?? AppColors.primary,
            ),
          ),
          const Spacer(),
          if (showArrow)
            // ignore: prefer_const_constructors
            CustomTransformArabic(
              child: const Icon(
                MyIcons.arrowRightOutline,
                color: AppColors.textSub,
                size: 18,
              ),
            ),
        ],
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    final lang = LangPrefs();
    context.showBottomSheet(
      bottomSheetBody: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              isArabic ? Icons.check_circle : Icons.circle_outlined,
              color: isArabic ? AppColors.primary : AppColors.textSub,
            ),
            title: Text("العربية", style: context.semiBold16),
            onTap: () {
              lang.setLangToArabic();
              globalRefContainer.invalidate(langPrefsProvider);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              !isArabic ? Icons.check_circle : Icons.circle_outlined,
              color: !isArabic ? AppColors.primary : AppColors.textSub,
            ),
            title: Text("English", style: context.semiBold16),
            onTap: () {
              lang.setLangToEnglish();
              globalRefContainer.invalidate(langPrefsProvider);
              Navigator.pop(context);
            },
          ),
          16.h,
        ],
      ),
    );
  }
}
