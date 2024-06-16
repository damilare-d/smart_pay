class EmailTokenRequest {
  final String email;

  EmailTokenRequest({required this.email});

  Map<String, dynamic> toJson() => {'email': email};
}

class EmailTokenResponse {
  final bool status;
  final String message;
  final dynamic data;
  final Map<String, List<String>>? errors;

  EmailTokenResponse({
    required this.status,
    required this.message,
    this.data,
    this.errors,
  });

  factory EmailTokenResponse.fromJson(Map<String, dynamic> json) {
    // Parsing errors if they exist
    Map<String, List<String>>? errors;
    if (json['errors'] != null) {
      errors = (json['errors'] as Map<String, dynamic>).map((key, value) {
        return MapEntry(key, List<String>.from(value as List));
      });
    }

    // Parsing data based on its type
    dynamic data;
    if (json['data'] != null) {
      if (json['data'] is List) {
        data = List<Map<String, dynamic>>.from(json['data']);
      } else if (json['data'] is Map) {
        data = EmailTokenData.fromJson(json['data']);
      }
    }

    return EmailTokenResponse(
      status: json['status'],
      message: json['message'],
      data: data,
      errors: errors,
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
