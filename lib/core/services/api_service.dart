import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartpay/core/models/models.dart';

class ApiService {
  final String _baseUrl = 'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1';

  Future<EmailTokenResponse> requestEmailToken(EmailTokenRequest request) async {
    try {
      final url = Uri.parse('$_baseUrl/auth/email');
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return EmailTokenResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to request email token: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error requesting email token: $e');
    }
  }

  Future<VerifyEmailTokenResponse> verifyEmailToken(VerifyEmailTokenRequest request) async {
    try {
      final url = Uri.parse('$_baseUrl/auth/email/verify');
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return VerifyEmailTokenResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to verify email token: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error verifying email token: $e');
    }
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final url = Uri.parse('$_baseUrl/auth/register');
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return RegisterResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to register: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error registering: $e');
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {

    try {
      final url = Uri.parse('$_baseUrl/auth/login');
      final response = await http.post(
        url,
        headers: {
      "Accept": "*/*",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }
}
