import 'package:flutter/material.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/app/application.dart';
import 'package:stacked/stacked.dart';

class CreateNewPasswordViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  TextEditingController createPasswordController  = TextEditingController();
  TextEditingController confirmPasswordController  = TextEditingController();

  bool isCreatePassWordVisible = false;
  bool isConfirmPassWordVisible = false;



  changeCreatePasswordVisibility() {
    isCreatePassWordVisible = !isCreatePassWordVisible;
    notifyListeners();
  }
  changeConfirmPasswordVisibility() {
    isConfirmPassWordVisible = !isConfirmPassWordVisible;
    notifyListeners();
  }

  void createNewPassword() {
    _navigationService.navigateTo(Routes.signInView);
  }
}