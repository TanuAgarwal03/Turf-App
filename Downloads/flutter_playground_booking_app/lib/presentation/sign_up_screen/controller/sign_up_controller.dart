import 'dart:convert';
import 'package:flutter_playground_booking_app/config/app_config.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService();
  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
  Rx<String?> errorMessage = Rx<String?>(null);
  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> registerUser(String role) async {
    // String url =
    //     'https://lytechxagency.website/turf/wp-json/wp/v1/register?firstname=${firstNameController.text} &lastname=${lastNameController.text}&email=${emailController.text}&password=${passwordController.text}&role=$role&profile_pic=123';
    try {
      var response = await apiService.postAPI('register?firstname=${firstNameController.text} &lastname=${lastNameController.text}&email=${emailController.text}&password=${passwordController.text}&role=$role&profile_pic=123', {'firstname': firstNameController.text,
          'lastname': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'role': role,
          'profile_pic': 123});
      // var response = await http.post(
      //   Uri.parse(url),
      //   body: {
      //     'firstname': firstNameController.text,
      //     'lastname': lastNameController.text,
      //     'email': emailController.text,
      //     'password': passwordController.text,
      //     'role': role,
      //     'profile_pic': 123
      //   },
      // );

      if (response.statusCode == 200) {
        await _saveDataLocally(response.body, role);
        Get.snackbar('Success', 'User registered successfully',
            duration: Duration(seconds: 2),
            backgroundColor: Colors.teal[800]);
            print(role);
        
      } else {
        var errorResponse = json.decode(response.body);
        print(errorResponse['message']);
        errorMessage.value =
            errorResponse['message'] ?? 'Failed to register user';
        Get.snackbar(
            'Error', 'Failed to register user: ${errorResponse['message']}');
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  Future<void> handleLoginResponse(String responseBody) async {
  final Map<String, dynamic> data = jsonDecode(responseBody);
  
  if (data['status'] == 200) {
    String role = data['role'];
    await saveUserRole(role);
    print('User role stored: $role'); 
  } else {
    print('SignUp failed');
  }
}
Future<void> saveUserRole(String role) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('role', role);
}

  Future<void> _saveDataLocally(String responseBody, String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }
}
