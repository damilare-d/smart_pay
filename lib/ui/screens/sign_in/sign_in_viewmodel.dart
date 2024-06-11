import 'package:flutter/cupertino.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/app/application.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  TextEditingController emailController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();

  bool isPassWordVisible = false;


  void signIn() {
    _navigationService.navigateTo(Routes.homeView);
  }

  changePasswordVisibility() {
    isPassWordVisible = !isPassWordVisible;
    notifyListeners();
  }

  void navigateToForgotPassword() {
    _navigationService.navigateTo(Routes.recoverPasswordView);
  }

  void googleAuth() {
  }

  void appleAuth() {
  }

  void signUp() {
    _navigationService.navigateTo(Routes.recoverPasswordView);
  }
}