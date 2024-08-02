/// This class defines the variables used in the [profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileModel {
  final String firstName;
  final String lastName;
  final String email;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
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