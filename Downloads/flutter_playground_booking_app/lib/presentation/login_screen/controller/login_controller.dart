// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/routes/app_routes.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../models/login_model.dart';

// class LoginController extends GetxController {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   Rx<LoginModel> loginModelObj = LoginModel().obs;
//   Rx<bool> isShowPassword = true.obs;
//    Rx<String?> emailError = Rx<String?>(null);
//   Rx<String?> passwordError = Rx<String?>(null);

//   @override
//   void onClose() {
//     super.onClose();
//     emailController.clear();
//     passwordController.clear();
//   }


// Future<void> login() async {
//   emailError.value = null;
//   passwordError.value = null;

//   bool isValid = true;

//   if (emailController.text.isEmpty) {
//     emailError.value = 'Please enter a valid email address.';
//     isValid = false;
//   }

//   if (passwordController.text.isEmpty) {
//     passwordError.value = 'Please enter a valid password.';
//     isValid = false;
//   }

//   if (isValid) {
//     try {
//       final response = await http.post(
//         Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/login?password=${passwordController.text}&username=${emailController.text}'),
//         // headers: <String, String>{
//         //   'Content-Type': 'application/json; charset=UTF-8',
//         // },
//         body: jsonEncode({
//           'username': emailController.text,
//           'password': passwordController.text,
//         }),
//       );
//       print('Response body: ${response.body}');
//       if (response.statusCode == 200) {
//         Get.snackbar('Success', 'Login successful');
//         Get.toNamed(AppRoutes.homeContainerScreen); // Navigate on success
//       } else {
//         var responseBody = jsonDecode(response.body);
//         var errorMessage = responseBody['message'] ?? 'Invalid credentials';
//         emailError.value = errorMessage;
//         passwordError.value = errorMessage;
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'An error occurred: $e');
//     }
//   }
// }
// }
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/login_model.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<String?> emailError = Rx<String?>(null);
  Rx<String?> passwordError = Rx<String?>(null);

  @override
  void onClose() {
    super.onClose();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> login() async {
    emailError.value = null;
    passwordError.value = null;

    bool isValid = true;

    if (emailController.text.isEmpty) {
      emailError.value = 'Please enter a valid email address.';
      isValid = false;
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = 'Please enter a valid password.';
      isValid = false;
    }

    if (isValid) {
      try {
        final response = await http.post(
          Uri.parse(
            'https://lytechxagency.website/turf/wp-json/wp/v1/login?password=${passwordController.text}&username=${emailController.text}',
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'username': emailController.text,
            'password': passwordController.text,
          }),
        );
        print('Response body: ${response.body}');
        if (response.statusCode == 200) {
          // Save response and credentials to local storage
          await _saveDataLocally(response.body, emailController.text, passwordController.text);

          Get.toNamed(AppRoutes.homeContainerScreen); // Navigate on success
        } else {
          var responseBody = jsonDecode(response.body);
          var errorMessage = responseBody['message'] ?? 'Invalid credentials';
          emailError.value = errorMessage;
          passwordError.value = errorMessage;
        }
      } catch (e) {
        Get.snackbar('Error', 'An error occurred: $e');
      }
    }
  }

  Future<void> _saveDataLocally(String responseBody, String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('login_response', responseBody);
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }
}
