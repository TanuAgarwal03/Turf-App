/// This class defines the variables used in the [login_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// class LoginModel { 
// }
class LoginModel {
  String? email;
  String? password;

  LoginModel({this.email, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}