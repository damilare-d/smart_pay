import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/ui/screens/sign_up/sign_up_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/widgets/auth_button.dart';
import 'package:smartpay/ui/widgets/auth_field.dart';
import 'package:smartpay/ui/widgets/custom_appbar.dart';
import 'package:smartpay/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../styles/style.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder:
            (BuildContext context, SignUpViewModel viewModel, Widget? child) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Create a ',
                    style: TextStyles(ThemeNotifier())
                        .titleLarge
                        .copyWith(color: kcAccentLightColor2),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Smartpay',
                        style: TextStyles(ThemeNotifier())
                            .titleLarge
                            .copyWith(color: kcAccentLightColor1),
                      ),
                      TextSpan(
                        text: '\naccount',
                        style: TextStyles(ThemeNotifier())
                            .titleLarge
                            .copyWith(color: kcAccentLightColor2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                AuthField(
                  controller: viewModel.emailController,
                  hintText: 'Email',
                  borderRadius: BorderRadius.circular(16),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(text: "Sign Up", onPressed: viewModel.signUp),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthButton(
                        svgAsset: "assets/svgs/google_logo.svg",
                        onPressed: viewModel.googleAuth),
                    const SizedBox(width: 8),
                    AuthButton(
                        svgAsset: "assets/svgs/Apple_logo_black.svg",
                        onPressed: viewModel.appleAuth),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In',
                          style: const TextStyle(
                            color: Color(0xFF0A6375),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              viewModel.signUp();
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
