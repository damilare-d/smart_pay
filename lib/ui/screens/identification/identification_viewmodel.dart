import 'package:flutter/material.dart';
import 'package:smartpay/app/app.locator.dart';
import 'package:smartpay/app/app.router.dart';
import 'package:smartpay/core/models/register_model.dart';
import 'package:smartpay/core/services/auth_repository.dart';
import 'package:smartpay/core/services/user_details_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../core/models/models.dart';
import '../../bottom_sheets/country_selwcwtion_sheet/country_selection_sheet.dart';

class IdentificationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authRepository = locator<AuthRepository>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userDetailsService = locator<UserDetailsService>();
  RegisterResponse? registerResponse;

  TextEditingController userNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassWordVisible = false;
  Country? selectedCountry;

  void changePasswordVisibility() {
    isPassWordVisible = !isPassWordVisible;
    notifyListeners();
  }

  Future<void> registerDetails() async {
    setBusy(true);

      registerResponse = await _authRepository.register(
        fullNameController.text,
        userNameController.text,
        _userDetailsService.email,
        selectedCountry?.code ?? "NG",
        passwordController.text,
        "phone",
      );

      print("sth");

      if (registerResponse?.status == true) {
        _navigationService.navigateTo(Routes.createPinView);
      } else {
        await _bottomSheetService.showBottomSheet(
          title: 'Registration Failed',
          description: registerResponse?.errors.toString() ?? 'Registration failed',
        );
      }
      setBusy(false);
      notifyListeners();

  }

  String? get countrySelected => selectedCountry?.name;

  void showCountrySelection(BuildContext context) async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.countrySelection,
      data: CountrySelectionSheet(
        completer: (response) {
          if (response != null) {
            selectedCountry = response.data;
            notifyListeners();
          }
        },
        request: SheetRequest(),
      ),
    );

    if (response?.confirmed == true) {
      selectedCountry = response?.data;
      notifyListeners();
    }
  }
}
