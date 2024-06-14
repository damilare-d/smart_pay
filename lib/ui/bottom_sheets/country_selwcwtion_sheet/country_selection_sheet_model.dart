import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:smartpay/core/services/user_details_service.dart';
import 'package:smartpay/app/app.locator.dart';

import '../../../core/models/models.dart';

class CountrySelectionSheetModel extends BaseViewModel {
  final UserDetailsService _userDetailsService = locator<UserDetailsService>();
  TextEditingController searchController = TextEditingController();

  List<Country> countries = [
    Country(name: 'Nigeria', code: 'NG', flag: 'assets/flags/ng.svg'),
    Country(
        name: 'United States', code: 'US', flag: 'assets/svgs/usa_flag.svg'),
    Country(name: 'China', code: 'CN', flag: 'assets/svgs/CN - China.svg'),
    Country(
        name: 'Indonesia', code: 'IN', flag: 'assets/svgs/indonesia_flag.svg'),
    Country(
        name: 'Netherlands',
        code: 'NL',
        flag: 'assets/svgs/NL - Netherlands.svg'),
    Country(
        name: 'Singapore', code: 'SG', flag: 'assets/svgs/SG - Singapore.svg'),
    Country(
        name: 'United Kingdom', code: 'UK', flag: 'assets/svgs/uk_flag.svg'),
  ];

  List<Country> filteredCountries = [];

  CountrySelectionSheetModel() {
    filteredCountries = countries;
  }

  void filterCountries(String query) {
    final results = countries
        .where((country) =>
            country.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    filteredCountries = results;
    notifyListeners();
  }

  bool isSelectedCountry(Country country) {
    return _userDetailsService.country == country.code;
  }

  void selectCountry(Country country) {
    _userDetailsService.country = country.name;
    notifyListeners();
  }
}
