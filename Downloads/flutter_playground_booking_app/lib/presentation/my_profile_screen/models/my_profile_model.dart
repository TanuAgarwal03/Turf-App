
class MyProfileModel {
  final String firstName;
  final String lastName;
  final String email;

  MyProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory MyProfileModel.fromJson(Map<String, dynamic> json) {
    return MyProfileModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    };
  }
}
