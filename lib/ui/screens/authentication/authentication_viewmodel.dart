

import 'package:flutter/cupertino.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/application.dart';

class AuthenticationViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  TextEditingController pinCodeController = TextEditingController();

  void confirmOTP() {
    _navigationService.navigateTo(Routes.identificationView);
  }
}