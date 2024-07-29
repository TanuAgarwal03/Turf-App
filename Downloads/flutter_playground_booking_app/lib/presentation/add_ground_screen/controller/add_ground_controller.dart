import 'package:flutter_playground_booking_app/core/app_export.dart';import 'package:flutter_playground_booking_app/presentation/add_ground_screen/models/add_ground_model.dart';import 'package:flutter/material.dart';/// A controller class for the AddGroundScreen.
///
/// This class manages the state of the AddGroundScreen, including the
/// current addGroundModelObj
class AddGroundController extends GetxController {TextEditingController masterInputController = TextEditingController();

TextEditingController emailController = TextEditingController();

TextEditingController masterInputController1 = TextEditingController();

TextEditingController masterInputController2 = TextEditingController();

TextEditingController masterInputController3 = TextEditingController();

Rx<AddGroundModel> addGroundModelObj = AddGroundModel().obs;

@override void onClose() { super.onClose(); masterInputController.dispose(); emailController.dispose(); masterInputController1.dispose(); masterInputController2.dispose(); masterInputController3.dispose(); } 
 }
