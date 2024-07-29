import 'package:flutter_playground_booking_app/core/app_export.dart';import 'package:flutter_playground_booking_app/presentation/edit_profile_screen/models/edit_profile_model.dart';import 'package:flutter/material.dart';/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {TextEditingController masterInputController = TextEditingController();

TextEditingController masterInputController1 = TextEditingController();

TextEditingController emailController = TextEditingController();

Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;

@override void onClose() { super.onClose(); masterInputController.dispose(); masterInputController1.dispose(); emailController.dispose(); } 
 }
