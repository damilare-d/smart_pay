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
  final RegisterData data;

  RegisterResponse({required this.status, required this.message, required this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      status: json['status'],
      message: json['message'],
      data: RegisterData.fromJson(json['data']),
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
