import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreateNewPasswordViewModel extends BaseViewModel{

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
  }
}