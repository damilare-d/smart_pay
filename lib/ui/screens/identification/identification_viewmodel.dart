import 'package:flutter/material.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/core/models/register_model.dart';
import 'package:smartpay/core/services/auth_repository.dart';
import 'package:smartpay/core/services/user_details_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IdentificationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _authRepository = locator<AuthRepository>();
  final _userDetail = locator<UserDetailsService>();
  RegisterResponse? registerResponse;

  TextEditingController userNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassWordVisible = false;

  changePasswordVisibility() {
    isPassWordVisible = !isPassWordVisible;
    notifyListeners();
  }

  Future<void> register(String fullName, String? username, String email,
      String country, String password, String deviceName) async {
    setBusy(true);
    try {
      registerResponse = await _authRepository.register(
          fullName, username, email, country, password, deviceName);
      if (registerResponse?.status == true) {
        _navigationService.navigateTo(Routes.createPinView);
      } else {
        final errors = registerResponse?.errors;
        String errorMessage = registerResponse?.message ?? 'Registration failed';
        if (errors != null && errors.isNotEmpty) {
          errorMessage += '\n${errors.values.map((e) => e.join(', ')).join('\n')}';
        }
        await _bottomSheetService.showBottomSheet(
          title: 'Registration Failed',
          description: errorMessage,
        );
      }
    } catch (e) {
      await _bottomSheetService.showBottomSheet(
        title: 'Error',
        description: 'Error during registration: $e ',
      );
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void registerDetails() {
    if (fullNameController.text.isEmpty || passwordController.text.isEmpty) {
      _bottomSheetService.showBottomSheet(
        title: 'Input Error',
        description: 'Full name and password cannot be empty',
      );
      return;
    }
    register(
        fullNameController.text,
        userNameController.text,
        _userDetail.email,
        "NG",
        passwordController.text,
        "phone");
  }
}
