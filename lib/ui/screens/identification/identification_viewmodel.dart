


import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class IdentificationViewModel extends BaseViewModel{
  TextEditingController userNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassWordVisible = false;

  changePasswordVisibility() {
    isPassWordVisible = !isPassWordVisible;
    notifyListeners();
  }



  void registerDetails() {
  }


}