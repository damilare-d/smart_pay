

import 'package:flutter/cupertino.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/app/application.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();

  void signUp() {
    _navigationService.navigateTo(Routes.authenticationView);

  }

  void googleAuth() {
  }

  void appleAuth() {
  }

  void signIn() {
    _navigationService.navigateTo(Routes.signInView);
  }
}