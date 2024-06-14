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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          text: ' yourself',
                          style: TextStyles(ThemeNotifier())
                              .titleLarge
                              .copyWith(color: kcAccentLightColor1),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
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
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap:() => viewModel.showCountrySelection(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xffF9FAFB),
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (viewModel.countrySelected == null) ? 'Country' : viewModel.countrySelected!,
                            style: TextStyles(ThemeNotifier()).bodyLarge.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const Icon(Icons.keyboard_arrow_down, color: kcAccentLightColor2),
                        ],
                      ),
                    ),
                  ),
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
