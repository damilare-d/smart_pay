import 'package:flutter/cupertino.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/application.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';

class RecoverPasswordViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  TextEditingController emailController = TextEditingController();

  void sendVerificationMail() {
    _navigationService.navigateTo(Routes.verifyIdentityView);
  }
}