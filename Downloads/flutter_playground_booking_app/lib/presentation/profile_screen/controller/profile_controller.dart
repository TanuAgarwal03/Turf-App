import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/profile_screen/models/profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ProfileScreen.
///
/// This class manages the state of the ProfileScreen, including the
/// current profileModelObj
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
