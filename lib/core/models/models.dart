class EmailTokenRequest {
  final String email;

  EmailTokenRequest({required this.email});

  Map<String, dynamic> toJson() => {'email': email};
}

class EmailTokenResponse {
  final bool status;
  final String message;
  final EmailTokenData data;

  EmailTokenResponse({required this.status, required this.message, required this.data});

  factory EmailTokenResponse.fromJson(Map<String, dynamic> json) {
    return EmailTokenResponse(
      status: json['status'],
      message: json['message'],
      data: EmailTokenData.fromJson(json['data']),
    );
  }
}

class EmailTokenData {
  final String token;

  EmailTokenData({required this.token});

  factory EmailTokenData.fromJson(Map<String, dynamic> json) {
    return EmailTokenData(token: json['token']);
  }
}

class VerifyEmailTokenRequest {
  final String email;
  final String token;

  VerifyEmailTokenRequest({required this.email, required this.token});

  Map<String, dynamic> toJson() => {'email': email, 'token': token};
}

class VerifyEmailTokenResponse {
  final bool status;
  final String message;
  final VerifyEmailTokenData data;

  VerifyEmailTokenResponse({required this.status, required this.message, required this.data});

  factory VerifyEmailTokenResponse.fromJson(Map<String, dynamic> json) {
    return VerifyEmailTokenResponse(
      status: json['status'],
      message: json['message'],
      data: VerifyEmailTokenData.fromJson(json['data']),
    );
  }
}

class VerifyEmailTokenData {
  final String email;

  VerifyEmailTokenData({required this.email});

  factory VerifyEmailTokenData.fromJson(Map<String, dynamic> json) {
    return VerifyEmailTokenData(email: json['email']);
  }
}

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

class User {
  final String fullName;
  final String? username;
  final String email;
  final String country;
  final String id;

  User({
    required this.fullName,
    this.username,
    required this.email,
    required this.country,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['full_name'],
      username: json['username'],
      email: json['email'],
      country: json['country'],
      id: json['id'],
    );
  }
}

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
  final LoginData data;

  LoginResponse({required this.status, required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      data: LoginData.fromJson(json['data']),
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
