import 'package:auto_route/auto_route.dart';
import 'package:bookly_x_client/app/core/data/user_pref.dart';
import 'package:bookly_x_client/app/core/enums/user_type.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/app/core/widgets/logo_name.dart';
import 'package:bookly_x_client/generated/assets.dart';
import 'package:bookly_x_client/generated/my_icons.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:bookly_x_client/router/auto_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: MediaQuery.of(context).padding + const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.pngBackGround,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LogoName(),
              32.h,
              Text(tr.chooseYourRole, style: context.bold24White),
              const Spacer(),
              _buildRoleCard(
                context: context,
                title: tr.client,
                description: tr.clientDescription,
                icon: MyIcons.userOutline,
                onTap: () {
                  setState(() {
                    _selected = 1;
                  });
                },
                isSelected: _selected == 1,
              ),
              16.h,
              _buildRoleCard(
                context: context,
                title: tr.staff,
                description: tr.staffDescription,
                icon: MyIcons.profile2userOutline,
                onTap: () {
                  setState(() {
                    _selected = 2;
                  });
                },
                isSelected: _selected == 2,
              ),
              const Spacer(),
              CustomButton(
                  onPress: () async {
                    if (_selected == 1) {
                      UserPrefs.setUserType(UserType.client);
                    } else {
                      UserPrefs.setUserType(UserType.staff);
                    }
                    const AuthRoute().push(context);
                  },
                  isDisabled: _selected == 0,
                  title: tr.kContinue,
                  border: Border.all(
                    width: 4,
                    color:
                        _selected == 0 ? Colors.transparent : AppColors.primary,
                  ),
                  buttonColor: AppColors.white,
                  borderRadius: 16,
                  height: 60,
                  textStyle: context.bold18.copyWith(
                    color:
                        _selected == 0 ? AppColors.textSub : AppColors.primary,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(8),
          height: 150,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: isSelected ? AppColors.primary : AppColors.textBorders,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: ListTile(
              key: ValueKey(isSelected),
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.textBorders,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon,
                    color: isSelected ? AppColors.white : AppColors.textSub),
              ),
              title: Text(title, style: context.medium16Black),
              subtitle: SizedBox(
                width: 250,
                child: Text(description, style: context.regular14TextMain),
              ),
              trailing: isSelected
                  ? Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child:
                          const Icon(Icons.check, color: AppColors.white, size: 16),
                    )
                  : null,
            ),
          )),
    );
  }
}
