import 'user_model.dart';

class RegisterRequest {
  final String fullName;
  final String? username;
  final String email;
  final String country;
  final String password;
  final String deviceName;

  RegisterRequest({
    required this.fullName,
    this.username,
    required this.email,
    required this.country,
    required this.password,
    required this.deviceName,
  });

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'username': username,
    'email': email,
    'country': country,
    'password': password,
    'device_name': deviceName,
  };
}

class RegisterResponse {
  final bool status;
  final String message;
  final dynamic data;
  final Map<String, List<String>>? errors;

  RegisterResponse({required this.status, required this.message, required this.data,  required this.errors,});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {


    dynamic data;
    if (json['data'] != null) {
      if (json['data'] is List) {
        data = List<Map<String, dynamic>>.from(json['data']);
      } else if (json['data'] is Map) {
        data = RegisterData.fromJson(json['data']);
      }
    }
    return RegisterResponse(
      status: json['status'],
      message: json['message'],
      data: data,
      errors: json.containsKey('errors')
          ? Map<String, List<String>>.from(json['errors'].map((key, value) => MapEntry(key, List<String>.from(value))))
          : {},
    );
  }
}

class RegisterData {
  final User user;
  final String token;

  RegisterData({required this.user, required this.token});

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}
