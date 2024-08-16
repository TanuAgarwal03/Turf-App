import 'dart:convert';

import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/profile_screen/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  TextEditingController profileController = TextEditingController();

  TextEditingController profileController1 = TextEditingController();

  TextEditingController profileController2 = TextEditingController();

  TextEditingController profileController3 = TextEditingController();

  Rx<ProfileModel> profileModelObj = ProfileModel(email: '' , firstName: '' , lastName: '' , image: '').obs;

  @override 
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int user_id = prefs.getInt('user_id') ?? 7;
    final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_user_details/?user_id=$user_id'));
    if(response.statusCode == 200) {
      profileModelObj.value =
          ProfileModel.fromJson(jsonDecode(response.body));
      print(user_id);
      print('User data fetched');
      print(profileModelObj.value.firstName);
    }else{
      print('Failed to fetch user data');
    }
  }

  @override
  void onClose() {
    super.onClose();
    profileController.dispose();
    profileController1.dispose();
    profileController2.dispose();
    profileController3.dispose();
  }
}
