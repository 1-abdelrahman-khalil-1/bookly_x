import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bookly_x/app/core/themes/app_colors.dart';
import 'package:bookly_x/app/core/utils/show_message.dart';
import 'package:bookly_x/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x/app/core/widgets/custom_appbar.dart';
import 'package:bookly_x/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x/app/core/widgets/custom_text_form_field.dart';
import 'package:bookly_x/app/core/widgets/images/custom_upload_image.dart';
import 'package:bookly_x/app/features/client/setting/presentation/controllers/client_setting_future_providers.dart';
import 'package:bookly_x/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ClientEditProfileScreen extends ConsumerStatefulWidget {
  const ClientEditProfileScreen({super.key});

  @override
  ConsumerState<ClientEditProfileScreen> createState() =>
      _ClientEditProfileScreenState();
}

class _ClientEditProfileScreenState
    extends ConsumerState<ClientEditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  bool _initialized = false;
  File? _selectedFile;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(clientProfileFutureProvider);
    final editState = ref.watch(clientEditProfileNotifierProvider);

    return Scaffold(
      appBar:
          const CustomAppbar(title: 'Edit Profile'), // tr.editProfile or string
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (user) {
          if (!_initialized) {
            _nameController.text = user.name;
            _emailController.text = user.email;
            _phoneController.text = user.phone;
            _profileImageUrl = user.client?.profileImageUrl;
            _initialized = true;
          }

          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: CustomUploadImage(
                      initImageUrl: _profileImageUrl,
                      isCircular: true,
                      profileSize: 88,
                      iconSize: 14,
                      iconBgColor: AppColors.textBorders,
                      onImageSelected: (file) {
                        setState(() {
                          _selectedFile = file;
                        });
                      },
                    ),
                  ),
                  24.h,
                  CustomTextFormField(
                    title: tr.fullName,
                    hint: tr.enterYourFullName,
                    controller: _nameController,
                  ),
                  16.h,
                  CustomTextFormField(
                    title: tr.email,
                    hint: tr.enterYourEmail,
                    controller: _emailController,
                    readOnly: true,
                  ),
                  16.h,
                  CustomTextFormField(
                    title: tr.phoneNumber,
                    hint: tr.enterYourPhoneNumber,
                    controller: _phoneController,
                    readOnly: true,
                  ),
                  48.h,
                  CustomButton(
                    title: tr.save,
                    isLoading: editState.isLoading,
                    onPress: () async {
                      if (_nameController.text.trim().isEmpty) {
                        setWarningMessage(tr.enterYourFullName);
                        return;
                      }

                      final success = await ref
                          .read(clientEditProfileNotifierProvider.notifier)
                          .updateProfile(
                            name: _nameController.text,
                            imageFile: _selectedFile,
                          );

                      if (success && context.mounted) {
                        setSuccessfullyMessage(tr.profileUpdatedSuccessfully);
                        context.pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
