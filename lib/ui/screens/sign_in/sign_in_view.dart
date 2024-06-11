import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpay/ui/screens/sign_in/sign_in_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/styles/dimension.dart';
import 'package:smartpay/ui/styles/style.dart';
import 'package:smartpay/ui/styles/theme_manager.dart';
import 'package:smartpay/ui/widgets/auth_button.dart';
import 'package:smartpay/ui/widgets/auth_field.dart';
import 'package:smartpay/ui/widgets/custom_button.dart';
import 'package:smartpay/ui/widgets/divider.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder: (
          BuildContext context,
          SignInViewModel viewModel,
          Widget? child,
        ) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(Dimen.largeSpacing),
                    Text(
                      "Hi There! 👋",
                      style: TextStyles(ThemeNotifier())
                          .titleLarge
                          .copyWith(color: kcAccentLightColor2),
                    ),
                    const Gap(Dimen.smallSpacing),
                    Text(
                      "Welcome back, Sign in to your account",
                      style: TextStyles(ThemeNotifier())
                          .bodySmall
                          .copyWith(color: kcAccentLightColor4),
                    ),
                    const SizedBox(height: 32),
                    AuthField(
                      controller: viewModel.emailController,
                      hintText: 'Email',
                      borderRadius: BorderRadius.circular(16),
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
                    const SizedBox(
                      height: 24,
                    ),
                    TextButton(
                        onPressed: viewModel.navigateToForgotPassword,
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: kcAccentLightColor1),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomButton(text: "Sign In", onPressed: viewModel.signIn),
                    const SizedBox(height: 32),
                    divider(),
                    const SizedBox(height: 32),
                    Row(
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
                    const SizedBox(height: 80,),
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: const TextStyle(color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign up',
                            style: const TextStyle(
                              color: Color(0xFF0A6375),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Sign up tapped');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
