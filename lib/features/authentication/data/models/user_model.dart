import 'package:jobs_it/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    super.birthday,
    super.phone,
    super.gender,
    super.location,
    super.university,
    super.jobWanted,
    super.position,
    super.jobType,
    super.major,
    super.jobLocation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: int.parse(json['id']),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      birthday: json['birthday'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      location: json['location'] as String,
      university: json['university'] as String,
      jobWanted: json['jobWanted'],
      position: json['position'],
      jobType: json['jobType'],
      major: json['major'],
      jobLocation: json['jobLocation'],
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      birthday: user.birthday,
      phone: user.phone,
      gender: user.gender,
      location: user.location,
      university: user.university,
      jobWanted: user.jobWanted,
      position: user.position,
      jobType: user.jobType,
      major: user.major,
      jobLocation: user.jobLocation,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'birthday': birthday,
      'phone': phone,
      'gender': gender,
      'location': location,
      'university': university,
      'jobWanted': jobWanted,
      'position': position,
      'jobType': jobType,
      'major': major,
      'jobLocation': jobLocation,
    };
  }

  User toEntity() {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      birthday: birthday,
      phone: phone,
      gender: gender,
      location: location,
      university: university,
      jobWanted: jobWanted,
      position: position,
      jobType: jobType,
      major: major,
      jobLocation: jobLocation,
    );
  }
}
