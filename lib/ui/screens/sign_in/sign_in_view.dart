import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartpay/ui/screens/sign_in/sign_in_viewmodel.dart';
import 'package:smartpay/ui/styles/dimension.dart';
import 'package:smartpay/ui/styles/style.dart';
import 'package:smartpay/ui/styles/theme_manager.dart';
import 'package:smartpay/ui/widgets/auth_field.dart';
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
            body: Column(
              children: [
                const Gap(Dimen.largeSpacing),
                Text(
                  "Hi There! 👋",
                  style: TextStyles(ThemeNotifier()).titleLarge,
                ),
                const Gap(Dimen.smallSpacing),
                Text(
                  "Welcome back, Sign in to your account",
                  style: TextStyles(ThemeNotifier()).bodySmall,
                ),
                const Gap(Dimen.mediumSpacing * 2),
                AuthField(
                  controller: viewModel.emailController,
                  hintText: 'Email',
                ),
                AuthField(
                  controller: viewModel.passwordController,
                  hintText: 'Email',
                  isVisible: viewModel.isPassWordVisible,
                ),
                TextButton(
                    onPressed: viewModel.signIn,
                    child: const Text("Forgot Password"))
              ],
            ),
          );
        });
  }
}
