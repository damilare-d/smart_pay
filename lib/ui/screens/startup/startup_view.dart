import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:smartpay/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';


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
        child: Image.asset("assets/images/logo.png",width: 148, height: 130,),
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
