import 'package:flutter/material.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/widgets/auth_field.dart';
import 'package:smartpay/ui/widgets/custom_appbar.dart';
import 'package:smartpay/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../styles/style.dart';
import 'create_new_password_viewmodel.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateNewPasswordViewModel>.reactive(
        viewModelBuilder: () => CreateNewPasswordViewModel(),
        builder: (BuildContext context, CreateNewPasswordViewModel viewModel,
            Widget? child) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create New Password",
                    style: TextStyles(ThemeNotifier())
                        .titleLarge
                        .copyWith(color: kcAccentLightColor2),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Please, enter a new password below different from the previous password",
                    style: TextStyles(ThemeNotifier())
                        .bodySmall
                        .copyWith(color: kcAccentLightColor4),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  AuthField(
                    controller: viewModel.createPasswordController,
                    hintText: 'Create Password',
                    isVisible: viewModel.isCreatePassWordVisible,
                    borderRadius: BorderRadius.circular(16),
                    isPassword: true,
                    isBorderColor: true,
                    maxLines: 1,
                    changeVisibilty: viewModel.changeCreatePasswordVisibility,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AuthField(
                    controller: viewModel.confirmPasswordController,
                    hintText: 'Confirm Password',
                    isVisible: viewModel.isConfirmPassWordVisible,
                    borderRadius: BorderRadius.circular(16),
                    isPassword: true,
                    isBorderColor: true,
                    maxLines: 1,
                    changeVisibilty: viewModel.changeConfirmPasswordVisibility,
                  ),
                  SizedBox(height: 20,),

                  CustomButton(
                      text: "Create new password",
                      onPressed: viewModel.createNewPassword)
                ],
              ),
            ),
          );
        });
  }
}
