import 'package:dio/dio.dart';
import 'package:smartpay/core/models/models.dart';


class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://smart-pay-mobile.herokuapp.com/'));

  Future<EmailTokenResponse> requestEmailToken(EmailTokenRequest request) async {
    final response = await _dio.post('/api/v1/auth/email', data: request.toJson());
    return EmailTokenResponse.fromJson(response.data);
  }

  Future<VerifyEmailTokenResponse> verifyEmailToken(VerifyEmailTokenRequest request) async {
    final response = await _dio.post('/api/v1/auth/email/verify', data: request.toJson());
    return VerifyEmailTokenResponse.fromJson(response.data);
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await _dio.post('/api/v1/auth/register', data: request.toJson());
    return RegisterResponse.fromJson(response.data);
  }

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _dio.post('/api/v1/auth/login', data: request.toJson());
    return LoginResponse.fromJson(response.data);
  }
}
