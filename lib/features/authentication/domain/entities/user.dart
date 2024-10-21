class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  String? birthday;
  String? phone;
  String? gender;
  String? location;
  String? university;
  String? jobWanted;
  String? position;
  String? major;
  String? jobType;
  String? jobLocation;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.birthday,
    this.phone,
    this.gender,
    this.location,
    this.university,
    this.jobWanted,
    this.position,
    this.jobType,
    this.jobLocation,
    this.major,
  });
}
