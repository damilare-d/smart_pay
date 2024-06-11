import 'package:flutter/material.dart';
import 'package:smartpay/app/application.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';

class OnboardingViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  PageController pageController = PageController();

  int currentPage = 0;

  OnboardingViewModel() {
    pageController.addListener(() {
      int pageIndex = pageController.page!.round();
      if (currentPage != pageIndex) {
        currentPage = pageIndex;
        notifyListeners();
      }
    });
  }

  void skip() {
  }

  void navigateToSignIn() {
    _navigationService.navigateTo(Routes.signInView);
  }
}