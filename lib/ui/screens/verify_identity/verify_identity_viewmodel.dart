

import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/app/application.dart';
import 'package:stacked/stacked.dart';

class VerifyIdentityViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  void verifyIdentity() {
    _navigationService.navigateTo(Routes.createNewPasswordView);
  }
}