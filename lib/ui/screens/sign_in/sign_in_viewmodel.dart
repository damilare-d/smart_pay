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
   loginResponse = await _authRepository.login(email, password, deviceName);
    setBusy(false);
    notifyListeners();
  }


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
    _navigationService.navigateTo(Routes.signUpView);
  }
}