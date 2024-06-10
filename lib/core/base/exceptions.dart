class ApiException implements Exception {
  String title;
  String message;
  String? stacktrace;

  ApiException(this.message, {this.stacktrace, this.title = "Backend Error"});

  @override
  String toString() {
    return 'ApiError: $message';
  }
}

class AuthException extends ApiException {
  AuthException(String message) : super(message, title: "Authentication Error");
  @override
  String toString() {
    return 'AuthError: $message';
  }
}

class ListingException extends ApiException {
  ListingException(String message) : super(message);
  @override
  String toString() {
    return 'Listing Error: $message';
  }
}

class IncorrectOTPError extends AuthException {
  IncorrectOTPError(String message) : super(message);
  @override
  String toString() {
    return 'OTPError: $message';
  }
}

class InternetConnectionException extends ApiException {
  InternetConnectionException([
    String message =
        "Network is unreachable! Please, check your internet connection and try again.",
  ]) : super(message);
  @override
  String toString() {
    return 'InternetConnectionException: $message';
  }
}
