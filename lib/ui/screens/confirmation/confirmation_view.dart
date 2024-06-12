import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/ui/screens/confirmation/confirmation_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/styles/style.dart';
import 'package:smartpay/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class ConfirmationView extends StatelessWidget {
  final String? userName;
  const ConfirmationView({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return  ViewModelBuilder<ConfirmationViewModel>.reactive(
        viewModelBuilder:()=> ConfirmationViewModel(),
        builder: (
        BuildContext context, ConfirmationViewModel viewModel, Widget? child
        ){
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/thumbs_up.png", width: 140, height: 134,),
                    const SizedBox(height: 32,),
                    Text(
                      "Congratulations ${userName ?? ""}",
                      style: TextStyles(ThemeNotifier())
                          .titleLarge
                          .copyWith(color: kcAccentLightColor2),
                      textAlign: TextAlign.center,
                    ),
                   const SizedBox(height: 12,),
                    Text(
                      "You’ve completed the onboarding,you can start using",
                      style: TextStyles(ThemeNotifier())
                          .bodySmall
                          .copyWith(color: kcAccentLightColor4),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32,),
                    CustomButton(text: "Get Started", onPressed: viewModel.navigateToHome)

                  ],
                ),
              ),
            ),
          );
        });
  }
}
