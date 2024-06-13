import 'package:flutter/cupertino.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/core/models/email_token_model.dart';
import 'package:smartpay/core/services/auth_repository.dart';
import 'package:smartpay/core/services/user_details_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _authRepository = locator<AuthRepository>();
  final _userDetail = locator<UserDetailsService>();

  TextEditingController emailController = TextEditingController();
  EmailTokenResponse? emailTokenResponse;

  Future<void> requestEmailToken(String email) async {
    setBusy(true);
    try {
      emailTokenResponse = await _authRepository.requestEmailToken(email);
      if (emailTokenResponse?.status == true) {
        _navigationService.navigateTo(Routes.authenticationView,
            arguments: AuthenticationViewArguments(
                email: email,
                verificationToken: emailTokenResponse?.data.token));
      } else {
        _bottomSheetService.showBottomSheet(
          title: 'Error',
          description: emailTokenResponse?.message ?? 'Unknown error occurred',
        );
      }
    } catch (e) {
      print(e);
      _bottomSheetService.showBottomSheet(
        title: 'Error',
        description: 'Error requesting email token: $e',
      );
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void signUp() {
    _userDetail.email = emailController.text;
    requestEmailToken(emailController.text);
  }

  void googleAuth() {
    _bottomSheetService.showBottomSheet(
      title: '....',
      description: 'Upcoming feature, stay smart',
    );
  }

  void appleAuth() {
    _bottomSheetService.showBottomSheet(
      title: '....',
      description: 'Upcoming feature, stay smart',
    );
  }

  void signIn() {
    _navigationService.navigateTo(Routes.signInView);
  }
}
