import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/ui/screens/verify_identity/verify_identity_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/styles/style.dart';
import 'package:smartpay/ui/widgets/custom_button.dart';
import 'package:smartpay/ui/widgets/email_card.dart';
import 'package:stacked/stacked.dart';

class VerifyIdentityView extends StatelessWidget {
  const VerifyIdentityView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ViewModelBuilder<VerifyIdentityViewModel>.reactive(
        viewModelBuilder: ()=> VerifyIdentityViewModel(),
        builder: (
        BuildContext context, VerifyIdentityViewModel viewModel, Widget? child
        ){
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32,),
                  SizedBox(
                    width: 90,
                    height: 76,
                    child: SvgPicture.asset("assets/svgs/account.svg"),
                  ),
                  const SizedBox(height: 24,),
                  Text("Verify your identity", style: TextStyles(ThemeNotifier())
                      .titleLarge
                      .copyWith(color: kcAccentLightColor2),),
                  const SizedBox(height: 12,),
                  RichText(
                    text: TextSpan(
                      text: 'Where would you like',
                      style: TextStyles(ThemeNotifier())
                          .bodySmall
                          .copyWith(color: kcAccentLightColor2),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Smartpay ',
                          style: TextStyles(ThemeNotifier())
                              .bodySmall
                              .copyWith(color: kcAccentLightColor1),),
                        TextSpan(
                          text: 'send your security code?',
                          style: TextStyles(ThemeNotifier())
                              .bodySmall
                              .copyWith(color: kcAccentLightColor2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),

                  const SizedBox(height: 32,),

                 const EmailCard(title: '', subtitle: '',),

                  Container(),
                  CustomButton(text: "Continue", onPressed: viewModel.verifyIdentity)
                 


                ],
              ),
            ),
          );
        });
  }
}
