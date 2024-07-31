import 'dart:convert';

import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the MyProfileScreen.

class MyProfileController extends GetxController {
  Rx<MyProfileModel> myProfileModelObj =
      MyProfileModel( email: '', firstName: '', lastName: '').obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('user_id') ?? 0;
    final response = await apiService.getAPI('user_profile?user_id=${userId}');
    if (response.statusCode == 200) {
      print(response.body);
      print(userId);
      myProfileModelObj.value =
          MyProfileModel.fromJson(jsonDecode(response.body));
    } else {
      // Handle error
      print(response.statusCode);
    }
  }
}
