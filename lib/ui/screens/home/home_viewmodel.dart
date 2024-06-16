import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.dialogs.dart';
import 'package:smartpay/app/app.bottomsheets.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/core/services/user_details_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:smartpay/core/services/api_service.dart';

class HomeViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService _apiService = locator<ApiService>();
  final _userDetailService = locator<UserDetailsService>();

  String? fullname = locator<UserDetailsService>().fullName;

  String get counterLabel => 'Counter is: $_counter';
  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: 'Custom Bottom Sheet Title',
      description: 'Custom Bottom Sheet Description',
    );
  }

  Future<void> fetchAndShowSecretSentence() async {
    setBusy(true);
    final response = await _apiService.fetchSecretSentence(_userDetailService.jwtToken);
    setBusy(false);

    if (response.success) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Secret Sentence',
        description: response.data!,
      );
    } else {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Error',
        description: response.error!,
      );
    }
  }

  void navigateToLogin() {
    _navigationService.replaceWithSignInView();
  }
}
