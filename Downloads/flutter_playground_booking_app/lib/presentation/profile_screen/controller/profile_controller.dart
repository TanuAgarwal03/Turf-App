import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/profile_screen/models/profile_model.dart';
import 'package:flutter/material.dart';

// // /// A controller class for the ProfileScreen.
// // ///
// // /// This class manages the state of the ProfileScreen, including the
// // /// current profileModelObj
class ProfileController extends GetxController {
  TextEditingController profileController = TextEditingController();

  TextEditingController profileController1 = TextEditingController();

  TextEditingController profileController2 = TextEditingController();

  TextEditingController profileController3 = TextEditingController();

  Rx<ProfileModel> profileModelObj = ProfileModel().obs;

  @override
  void onClose() {
    super.onClose();
    profileController.dispose();
    profileController1.dispose();
    profileController2.dispose();
    profileController3.dispose();
  }
}
// import 'dart:convert';
// import 'dart:convert';
// import 'package:flutter_playground_booking_app/config/app_config.dart';
// import 'package:flutter_playground_booking_app/presentation/profile_screen/models/profile_model.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class ProfileController extends GetxController {
//   Rx<ProfileModel> userProfile = ProfileModel(
//     firstName: '',
//     lastName: '',
//     email: '',
//   ).obs;
//   final ApiService apiService = ApiService();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserProfile();
//   }

//   Future<void> fetchUserProfile() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       int userId = prefs.getInt('user_id') ?? 0;
//       final response = await apiService.getAPI('user_profile?user_id=${userId}');
      
//       // final response = await http.get(
//       //   Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/user_profile?user_id=$userId'),
//       //   headers: {
//       //     'Content-Type': 'application/json',
//       //   },
//       // );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         userProfile.value = ProfileModel.fromJson(data);
//         print('profile data fetched successfully');
//       } else {
//         // Handle error
//         print('Error fetching user profile: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Exception occurred: $e');
//     }
//   }
// }
