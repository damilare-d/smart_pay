import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/core/services/auth_repository.dart';
import 'package:smartpay/core/services/user_details_service.dart';
import 'package:smartpay/ui/styles/colors.dart';
import 'package:smartpay/utils/extensions.dart';
import 'package:stacked/stacked.dart';

import '../../../app/application.dart';
import '../../../core/models/models.dart';

class SignInViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authRepository = locator<AuthRepository>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userDetailService = locator<UserDetailsService>();
  LoginResponse? loginResponse;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassWordVisible = false;

  Future<void> login() async {
    setBusy(true);
    try {
      loginResponse = await _authRepository.login(emailController.text, passwordController.text, "web");

      if (loginResponse?.status == true) {
        _userDetailService.jwtToken = loginResponse!.data!.token;
        _userDetailService.fullName = loginResponse!.data!.user.fullName;
        _navigationService.navigateTo(Routes.homeView);
      } else {
        String errorMessage = loginResponse?.message ?? 'Login failed';
        if (loginResponse?.errors != null) {
          loginResponse!.errors!.forEach((key, value) {
            errorMessage += '\n${key.capitalize()}: ${value.join(', ')}';
          });
        }
        await _bottomSheetService.showBottomSheet(
          title: 'Error',
          description: errorMessage,
        );
      }
    } catch (e) {
      await _bottomSheetService.showBottomSheet(
        title: 'Error',
        description: 'Error logging in: $e',
      );
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void signIn() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _bottomSheetService.showBottomSheet(
        title: 'Error',
        description: 'Email and password cannot be empty',
      );
      return;
    }
    login();
  }


  changePasswordVisibility() {
    isPassWordVisible = !isPassWordVisible;
    notifyListeners();
  }

  void navigateToForgotPassword() {
    _navigationService.navigateTo(Routes.recoverPasswordView);
  }

  void googleAuth() {
    _bottomSheetService.showBottomSheet(
        title: '....',
        description: 'Upcoming feature, stay smart',);
  }

  void appleAuth() {
    _bottomSheetService.showBottomSheet(
        title: '....',
        description: 'Upcoming feature, stay smart',);
  }

  void signUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }
}
