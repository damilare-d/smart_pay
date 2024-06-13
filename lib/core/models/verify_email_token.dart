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
