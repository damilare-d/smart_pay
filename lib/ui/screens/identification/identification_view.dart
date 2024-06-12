

import 'package:flutter/material.dart';
import 'package:smartpay/ui/screens/identification/identification_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/widgets/auth_field.dart';
import 'package:smartpay/ui/widgets/custom_appbar.dart';
import 'package:smartpay/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../styles/style.dart';

class IdentificationView extends StatelessWidget {
  const IdentificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IdentificationViewModel>.reactive(
        viewModelBuilder:()=> IdentificationViewModel(),
        builder: (
        BuildContext context, IdentificationViewModel viewModel, Widget? child
            ){
          return Scaffold(
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Hey there! tell us a bit',
                      style: TextStyles(ThemeNotifier())
                          .titleLarge
                          .copyWith(color: kcAccentLightColor2),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nabout',
                          style: TextStyles(ThemeNotifier())
                              .titleLarge
                              .copyWith(color: kcAccentLightColor2),
                        ),
                        TextSpan(
                          text: 'yourself',
                          style: TextStyles(ThemeNotifier())
                              .titleLarge
                              .copyWith(color: kcAccentLightColor1),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32,),
                  AuthField(
                    controller: viewModel.fullNameController,
                    hintText: 'Full name',
                    borderRadius: BorderRadius.circular(16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AuthField(
                    controller: viewModel.userNameController,
                    hintText: 'Username',
                    borderRadius: BorderRadius.circular(16),
                  ),

                  /// todo
                  /// create a container list tile and a bottom sheet to selec
                  /// countries.
                  const SizedBox(
                    height: 16,
                  ),
                  AuthField(
                    controller: viewModel.passwordController,
                    hintText: 'Password',
                    isVisible: viewModel.isPassWordVisible,
                    borderRadius: BorderRadius.circular(16),
                    isPassword: true,
                    isBorderColor: true,
                    maxLines: 1,
                    changeVisibilty: viewModel.changePasswordVisibility,
                  ),
                  const SizedBox(height: 24,),
                  CustomButton(text: "Continue", onPressed: viewModel.registerDetails),

                ],
              ),
            ),
          );

        });
  }
}
