// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i14;
import 'package:flutter/material.dart';
import 'package:smartpay/ui/screens/authentication/authentication_view.dart'
    as _i10;
import 'package:smartpay/ui/screens/confirmation/confirmation_view.dart'
    as _i13;
import 'package:smartpay/ui/screens/create_new_password/create_new_password_view.dart'
    as _i8;
import 'package:smartpay/ui/screens/create_pin/create_pin_view.dart' as _i12;
import 'package:smartpay/ui/screens/home/home_view.dart' as _i2;
import 'package:smartpay/ui/screens/identification/identification_view.dart'
    as _i11;
import 'package:smartpay/ui/screens/onboarding/onboarding_view.dart' as _i4;
import 'package:smartpay/ui/screens/recover_password/recover_password_view.dart'
    as _i6;
import 'package:smartpay/ui/screens/sign_in/sign_in_view.dart' as _i5;
import 'package:smartpay/ui/screens/sign_up/sign_up_view.dart' as _i9;
import 'package:smartpay/ui/screens/startup/startup_view.dart' as _i3;
import 'package:smartpay/ui/screens/verify_identity/verify_identity_view.dart'
    as _i7;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i15;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const onboardingView = '/onboarding-view';

  static const signInView = '/sign-in-view';

  static const recoverPasswordView = '/recover-password-view';

  static const verifyIdentityView = '/verify-identity-view';

  static const createNewPasswordView = '/create-new-password-view';

  static const signUpView = '/sign-up-view';

  static const authenticationView = '/authentication-view';

  static const identificationView = '/identification-view';

  static const createPinView = '/create-pin-view';

  static const confirmationView = '/confirmation-view';

  static const all = <String>{
    homeView,
    startupView,
    onboardingView,
    signInView,
    recoverPasswordView,
    verifyIdentityView,
    createNewPasswordView,
    signUpView,
    authenticationView,
    identificationView,
    createPinView,
    confirmationView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i5.SignInView,
    ),
    _i1.RouteDef(
      Routes.recoverPasswordView,
      page: _i6.RecoverPasswordView,
    ),
    _i1.RouteDef(
      Routes.verifyIdentityView,
      page: _i7.VerifyIdentityView,
    ),
    _i1.RouteDef(
      Routes.createNewPasswordView,
      page: _i8.CreateNewPasswordView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i9.SignUpView,
    ),
    _i1.RouteDef(
      Routes.authenticationView,
      page: _i10.AuthenticationView,
    ),
    _i1.RouteDef(
      Routes.identificationView,
      page: _i11.IdentificationView,
    ),
    _i1.RouteDef(
      Routes.createPinView,
      page: _i12.CreatePinView,
    ),
    _i1.RouteDef(
      Routes.confirmationView,
      page: _i13.ConfirmationView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.SignInView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SignInView(),
        settings: data,
      );
    },
    _i6.RecoverPasswordView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.RecoverPasswordView(),
        settings: data,
      );
    },
    _i7.VerifyIdentityView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.VerifyIdentityView(),
        settings: data,
      );
    },
    _i8.CreateNewPasswordView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.CreateNewPasswordView(),
        settings: data,
      );
    },
    _i9.SignUpView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SignUpView(),
        settings: data,
      );
    },
    _i10.AuthenticationView: (data) {
      final args = data.getArgs<AuthenticationViewArguments>(
        orElse: () => const AuthenticationViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.AuthenticationView(
            key: args.key,
            email: args.email,
            verificationToken: args.verificationToken),
        settings: data,
      );
    },
    _i11.IdentificationView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.IdentificationView(),
        settings: data,
      );
    },
    _i12.CreatePinView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.CreatePinView(),
        settings: data,
      );
    },
    _i13.ConfirmationView: (data) {
      final args = data.getArgs<ConfirmationViewArguments>(
        orElse: () => const ConfirmationViewArguments(),
      );
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.ConfirmationView(key: args.key, userName: args.userName),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AuthenticationViewArguments {
  const AuthenticationViewArguments({
    this.key,
    this.email,
    this.verificationToken,
  });

  final _i14.Key? key;

  final String? email;

  final String? verificationToken;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email", "verificationToken": "$verificationToken"}';
  }

  @override
  bool operator ==(covariant AuthenticationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.email == email &&
        other.verificationToken == verificationToken;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode ^ verificationToken.hashCode;
  }
}

class ConfirmationViewArguments {
  const ConfirmationViewArguments({
    this.key,
    this.userName,
  });

  final _i14.Key? key;

  final String? userName;

  @override
  String toString() {
    return '{"key": "$key", "userName": "$userName"}';
  }

  @override
  bool operator ==(covariant ConfirmationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.userName == userName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userName.hashCode;
  }
}

extension NavigatorStateExtension on _i15.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecoverPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.recoverPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyIdentityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyIdentityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateNewPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createNewPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthenticationView({
    _i14.Key? key,
    String? email,
    String? verificationToken,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.authenticationView,
        arguments: AuthenticationViewArguments(
            key: key, email: email, verificationToken: verificationToken),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToIdentificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.identificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreatePinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmationView({
    _i14.Key? key,
    String? userName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.confirmationView,
        arguments: ConfirmationViewArguments(key: key, userName: userName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecoverPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.recoverPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyIdentityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyIdentityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateNewPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createNewPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthenticationView({
    _i14.Key? key,
    String? email,
    String? verificationToken,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.authenticationView,
        arguments: AuthenticationViewArguments(
            key: key, email: email, verificationToken: verificationToken),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithIdentificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.identificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreatePinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmationView({
    _i14.Key? key,
    String? userName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.confirmationView,
        arguments: ConfirmationViewArguments(key: key, userName: userName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
