class Jwt {
  Token access;
  Token refresh;

  Jwt(this.access, this.refresh);

  factory Jwt.fromJson(Map<String, dynamic> json) => Jwt(
        Token.fromJson((json['access'] as Map<String, dynamic>)),
        Token.fromJson(json['refresh'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
      };
}

class Token {
  String token;
  int expiredAt;

  Token(this.token, this.expiredAt);

  DateTime get expirationTime =>
      DateTime.fromMillisecondsSinceEpoch(expiredAt * 1000);

  bool get isExpired => expirationTime.isBefore(DateTime.now());

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        json['token'],
        (json['expiredAt'] as int),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'expiredAt': expiredAt,
      };

  @override
  String toString() {
    return 'Token{token: $token, expiredAt: $expiredAt}';
  }
}
