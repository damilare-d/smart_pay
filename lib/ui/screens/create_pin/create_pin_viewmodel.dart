

import 'package:flutter/cupertino.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/app/application.dart';
import 'package:stacked/stacked.dart';

class CreatePinViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  TextEditingController pinCodeController = TextEditingController();


  void createPin() {
    _navigationService.navigateTo(Routes.confirmationView);
  }
}