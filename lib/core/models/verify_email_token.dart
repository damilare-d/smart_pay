class VerifyEmailTokenRequest {
  final String email;
  final String token;

  VerifyEmailTokenRequest({required this.email, required this.token});

  Map<String, dynamic> toJson() => {'email': email, 'token': token};
}

class VerifyEmailTokenResponse {
  final bool status;
  final String message;
  final dynamic data;
  final Map<String, List<String>>? errors;

  VerifyEmailTokenResponse({required this.status, required this.message, required this.data, this.errors});

  factory VerifyEmailTokenResponse.fromJson(Map<String, dynamic> json) {

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
        data = VerifyEmailTokenData.fromJson(json['data']);
      }
    }
    return VerifyEmailTokenResponse(
      status: json['status'],
      message: json['message'],
      data: data,
      errors: errors
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
