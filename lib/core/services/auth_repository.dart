import 'package:smartpay/app/app.locator.dart';

import 'api_service.dart';
import 'package:smartpay/core/models/models.dart';


class AuthRepository {
  final ApiService _apiService = locator<ApiService>();

  Future<EmailTokenResponse> requestEmailToken(String email) async {
    return await _apiService.requestEmailToken(EmailTokenRequest(email: email));
  }

  Future<VerifyEmailTokenResponse> verifyEmailToken(String email, String token) async {
    return await _apiService.verifyEmailToken(VerifyEmailTokenRequest(email: email, token: token));
  }

  Future<RegisterResponse> register(String fullName, String? username, String email, String country, String password, String deviceName) async {
    return await _apiService.register(RegisterRequest(
      fullName: fullName,
      username: username,
      email: email,
      country: country,
      password: password,
      deviceName: deviceName,
    ));
  }

  Future<LoginResponse> login(String email, String password, String deviceName) async {
    return await _apiService.login(LoginRequest(
      email: email,
      password: password,
      deviceName: deviceName,
    ));
  }
}
