import 'package:flutter/material.dart';
import 'package:smartpay/ui/screens/authentication/authentication_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/widgets/custom_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../styles/style.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
        viewModelBuilder:()=> AuthenticationViewModel(),
        builder: (BuildContext context, AuthenticationViewModel viewModel, Widget? child){
          return  Scaffold(
            appBar: const CustomAppBar(),
            body: Column(
              children: [
                Text(
                  "Verify it’s you",
                  style: TextStyles(ThemeNotifier())
                      .titleLarge
                      .copyWith(color: kcAccentLightColor2),
                ),
              const SizedBox(height: 12,),
                Text(
                  "We send a code to ( *****@mail.com ). Enter it here to verify your identity",
                  style: TextStyles(ThemeNotifier())
                      .bodySmall
                      .copyWith(color: kcAccentLightColor4),
                ),
              ],
            ),
          );
        });
  }
}
