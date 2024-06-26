import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:smartpay/ui/screens/create_pin/create_pin_viewmodel.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/styles/style.dart';
import 'package:smartpay/ui/widgets/custom_appbar.dart';
import 'package:smartpay/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class CreatePinView extends StatelessWidget {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatePinViewModel>.reactive(
        viewModelBuilder: () => CreatePinViewModel(),
        builder: (BuildContext context, CreatePinViewModel viewModel,
            Widget? child) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Set your PIN code",
                    style: TextStyles(ThemeNotifier())
                        .titleLarge
                        .copyWith(color: kcAccentLightColor2),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "We use state-of-the-art security measures to protect your information at all times",
                    style: TextStyles(ThemeNotifier())
                        .bodySmall
                        .copyWith(color: kcAccentLightColor4),
                  ),
                 const SizedBox(height: 32,),
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
                        pinTextStyle: TextStyles(ThemeNotifier()).titleLarge.copyWith(fontWeight: FontWeight.w700),

                        pinBoxHeight: 56,
                        pinBoxWidth: 56,
                        onDone: (value) {
                          viewModel.createPin;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 120,),
                  CustomButton(text: "Create PIN", onPressed: viewModel.createPin)
                ],
              ),
            ),
          );
        });
  }
}
