

import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/app/application.dart';
import 'package:stacked/stacked.dart';

class ConfirmationViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  void navigateToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }
}