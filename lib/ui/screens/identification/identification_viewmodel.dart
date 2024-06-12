


import 'package:flutter/cupertino.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/app/application.dart';
import 'package:stacked/stacked.dart';

class IdentificationViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  
  TextEditingController userNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassWordVisible = false;

  changePasswordVisibility() {
    isPassWordVisible = !isPassWordVisible;
    notifyListeners();
  }



  void registerDetails() {
    _navigationService.navigateTo(Routes.createPinView);
  }


}