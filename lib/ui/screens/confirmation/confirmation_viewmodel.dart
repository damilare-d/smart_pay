import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/app/application.dart';
import 'package:smartpay/core/models/login_model.dart';
import 'package:smartpay/core/services/auth_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:smartpay/core/services/user_details_service.dart';

class ConfirmationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authRepository = locator<AuthRepository>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userDetailsService = locator<UserDetailsService>();
  LoginResponse? loginResponse;

  Future<void> login() async {
    setBusy(true);
    try {
      loginResponse = await _authRepository.login(_userDetailsService.email,
          _userDetailsService.password, "phone");
      if (loginResponse?.status == true) {
        navigateToHome();
      } else {
        await _bottomSheetService.showBottomSheet(
          title: 'Login Failed',
          description: loginResponse?.message ?? 'Failed to login',
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

  void navigateToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }
}
