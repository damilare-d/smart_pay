import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:smartpay/ui/screens/authentication/authentication_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/widgets/custom_appbar.dart';
import 'package:stacked/stacked.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../app/app.router.dart';
import '../../styles/style.dart';
import '../../widgets/custom_button.dart';

class AuthenticationView extends StatelessWidget {
  final String? email;
  final String? verificationToken;
  const AuthenticationView({super.key, this.email, this.verificationToken});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
      viewModelBuilder: () => AuthenticationViewModel(),
      builder: (BuildContext context, AuthenticationViewModel viewModel,
          Widget? child) {
        return Scaffold(
          appBar: const CustomAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify it’s you",
                  style: TextStyles(ThemeNotifier())
                      .titleLarge
                      .copyWith(color: kcAccentLightColor2),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    text: 'We sent a code to ',
                    style: TextStyles(ThemeNotifier())
                        .bodySmall
                        .copyWith(color: kcAccentLightColor4),
                    children: <TextSpan>[
                      TextSpan(
                        text: email != null ? '($email)' : '( *****@mail.com )',
                        style: TextStyles(ThemeNotifier()).bodySmall.copyWith(
                              color: kcAccentLightColor2,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      TextSpan(
                        text: '. Enter it here to verify your identity',
                        style: TextStyles(ThemeNotifier())
                            .bodySmall
                            .copyWith(color: kcAccentLightColor4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PinCodeTextField(
                      maxLength: 5,
                      pinBoxRadius: 12,
                      pinBoxBorderWidth: 1,
                      pinBoxColor: const Color(0xffF9FAFB),
                      defaultBorderColor: Colors.transparent,
                      hasTextBorderColor: kcAccentLightColor1,
                      controller: viewModel.pinCodeController,
                      pinTextStyle: TextStyles(ThemeNotifier())
                          .titleLarge
                          .copyWith(fontWeight: FontWeight.w700),
                      pinBoxHeight: 56,
                      pinBoxWidth: 56,
                      onDone: (value) {
                        if (email != null) {
                          viewModel.confirmOTP(email!, value);
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Email is null. Cannot proceed.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Center(child: Text("Resend Code 30 secs")),
                 Center(
                   child: TextButton(onPressed: () { viewModel.showDialog(verificationToken!); },
                   child: const Text("show pin"),),
                 ),

                const SizedBox(height: 62),
                CustomButton(
                  text: 'Confirm',
                  onPressed: () {
                    if (email != null) {
                      viewModel.confirmOTP(
                          email!, viewModel.pinCodeController.text);
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Email is null. Cannot proceed.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}
