
class MyProfileModel {
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String image;

  MyProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.image,
  });

  factory MyProfileModel.fromJson(Map<String, dynamic> json) {
    return MyProfileModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      role:json['role'] ?? 'user',
      image: json['profile_pic'] ?? 'assets/images/img_avtar_1.svg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'role' : role,
      'profile_pic': image,
    };
  }
}
