

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/ui/screens/recover_password/recover_password_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/styles/style.dart';
import 'package:smartpay/ui/widgets/auth_field.dart';
import 'package:smartpay/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class RecoverPasswordView extends StatelessWidget {
  const RecoverPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ViewModelBuilder<RecoverPasswordViewModel>.reactive(
      viewModelBuilder: ()=> RecoverPasswordViewModel(), 
      builder: (BuildContext context, RecoverPasswordViewModel viewModel, Widget? child) { 
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 76,
                  child: SvgPicture.asset("assets/svgs/padlock.svg"),
                ),
                Text("Password Recovery",  style: TextStyles(ThemeNotifier())
                    .titleLarge
                    .copyWith(color: kcAccentLightColor2),),
                const SizedBox(height: 12,),
                const Text("Enter your registered email below to receive password instructions"),
                const SizedBox(height: 32,),
                AuthField(controller: viewModel.emailController, hintText: "Email"),
                Container(),
                CustomButton(text: "Send me email", onPressed: viewModel.sendVerificationMail)
              ],
            ),
          ),
        );
      },);
  }
}
