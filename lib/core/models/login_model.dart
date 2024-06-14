import 'user_model.dart';

class LoginRequest {
  final String email;
  final String password;
  final String deviceName;

  LoginRequest({required this.email, required this.password, required this.deviceName});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'device_name': deviceName,
  };
}

class LoginResponse {
  final bool status;
  final String message;
  final LoginData? data;
  final Map<String, List<String>>? errors;

  LoginResponse({required this.status, required this.message, this.data, this.errors});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
      errors: json['errors'] != null
          ? (json['errors'] as Map<String, dynamic>).map((key, value) => MapEntry(key, List<String>.from(value)))
          : null,
    );
  }
}

class LoginData {
  final User user;
  final String token;

  LoginData({required this.user, required this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}
