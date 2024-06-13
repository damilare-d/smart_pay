import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/core/models/models.dart';
import 'package:smartpay/core/services/auth_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';

class AuthenticationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authRepository = locator<AuthRepository>();
  final _dialogService = locator<DialogService>();
  VerifyEmailTokenResponse? verifyEmailTokenResponse;

  TextEditingController pinCodeController = TextEditingController();

  Future<void> verifyEmailToken(String email, String token) async {
    setBusy(true);
    try {
      verifyEmailTokenResponse =
          await _authRepository.verifyEmailToken(email, token);
      if (verifyEmailTokenResponse?.status == true) {
        _navigationService.navigateTo(Routes.identificationView);
      } else {
        Fluttertoast.showToast(
          msg: verifyEmailTokenResponse?.message ?? 'Unknown error occurred',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error verifying email token: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void showDialog(String pin) {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Pin',
      description: 'copy and paste $pin for verification',
    );
  }

  void confirmOTP(String email, String token) {
    verifyEmailToken(email, token);
  }
}
