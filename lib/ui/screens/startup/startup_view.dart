import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:smartpay/ui/common/ui_helpers.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/ui/styles/theme_manager.dart';
import 'package:stacked/stacked.dart';


import '../../styles/style.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/svgs/smart_pay_logo.svg",width: 72, height: 72,),
           const SizedBox(height: 16,),
            RichText(
              text: TextSpan(
                text: 'Smart',
                style: TextStyles(ThemeNotifier())
                    .titleLarge
                    .copyWith(color: kcAccentLightColor2),
                children: <TextSpan>[
                  TextSpan(
                    text: 'pay.',
                    style: TextStyles(ThemeNotifier())
                        .titleLarge
                        .copyWith(color: kcAccentLightColor1),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
