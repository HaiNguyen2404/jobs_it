import 'package:jobs_it/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  final String token;

  UserModel({
    required super.name,
    required super.username,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      username: json['username'],
      token: json['token'],
    );
  }

  User toEntity() {
    return User(
      name: name,
      username: username,
    );
  }
}
