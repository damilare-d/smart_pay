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
