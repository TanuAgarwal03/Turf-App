import 'dart:convert';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/sign_up_screen/models/sign_up_model.dart';

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

  Future<void> registerUser() async {
    String url =
        'https://lytechxagency.website/turf/wp-json/wp/v1/register?firstname=${firstNameController.text} &lastname=${lastNameController.text}&email=${emailController.text}&password=${passwordController.text}&role=user';
        
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          'firstname': firstNameController.text,
          'lastname': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'role': 'user',
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'User registered successfully',
            duration: Duration(seconds: 4),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.teal[800]);
      } else {
        var errorResponse = json.decode(response.body);
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
}
