import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:smartpay/ui/screens/authentication/authentication_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/widgets/custom_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../styles/style.dart';
import '../../widgets/custom_button.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
        viewModelBuilder:()=> AuthenticationViewModel(),
        builder: (BuildContext context, AuthenticationViewModel viewModel, Widget? child){
          return  Scaffold(
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PinCodeTextField(
                          maxLength: 5,
                          pinBoxRadius: 12,
                          pinBoxBorderWidth: 1,
                          pinBoxColor: const Color(0xffF9FAFB),
                          defaultBorderColor: Colors.transparent,
                          hasTextBorderColor: kcAccentLightColor1,

                          pinBoxHeight: 56,
                          pinBoxWidth: 56,
                          onDone: (value) {
                            //navigator.navigateTo(Routes.changePasswordScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32,),
                  const Text("Resend Code 30 secs"),
                  Container(),
                  CustomButton(text: 'Confirm', onPressed: viewModel.confirmOTP,)
                ],
              ),
            ),
          );
        });
  }
}
