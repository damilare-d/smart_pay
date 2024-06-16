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
  final dynamic data;
  final Map<String, List<String>>? errors;

  LoginResponse({
    required this.status,
    required this.message,
    this.data,
    this.errors,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>>? errors;

    if (json['errors'] != null) {
      errors = (json['errors'] as Map<String, dynamic>).map((key, value) {
        return MapEntry(key, List<String>.from(value as List));
      });
    }

    dynamic data;
    if (json['data'] != null) {
      if (json['data'] is List) {
        data = List<Map<String, dynamic>>.from(json['data']);
      } else if (json['data'] is Map) {
        data = LoginData.fromJson(json['data']);
      }
    }

    return LoginResponse(
      status: json['status'],
      message: json['message'],
      data: data,
      errors: errors,
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





