
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
