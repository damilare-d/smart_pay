import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/app/application.dart';
import 'package:smartpay/core/models/models.dart';
import 'package:smartpay/core/services/auth_repository.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  final _authRepository = locator<AuthRepository>();
  LoginResponse? loginResponse;

  TextEditingController emailController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();

  bool isPassWordVisible = false;


  Future<void> login(String email, String password, String deviceName) async {
    setBusy(true);
    try {
      loginResponse = await _authRepository.login(email, password, deviceName);
      print(loginResponse?.message);
    } catch (e) {
      print("Login error: $e");
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }


  void signIn() {
    print(emailController.text);
    try {
      login(emailController.text, passwordController.text, "deviceName");
      if (loginResponse!.status == false) {
        return;
      }
      else{
        _navigationService.navigateTo(Routes.homeView);
      }
    } on Exception catch (e) {
      print("the error is $e");
    }
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
    _navigationService.navigateTo(Routes.signUpView);
  }
}