import 'package:flutter_playground_booking_app/core/app_export.dart';import 'package:flutter_playground_booking_app/presentation/write_a_review_screen/models/write_a_review_model.dart';import 'package:flutter/material.dart';/// A controller class for the WriteAReviewScreen.
///
/// This class manages the state of the WriteAReviewScreen, including the
/// current writeAReviewModelObj
class WriteAReviewController extends GetxController {TextEditingController group1171274964Controller = TextEditingController();

Rx<WriteAReviewModel> writeAReviewModelObj = WriteAReviewModel().obs;

@override void onClose() { super.onClose(); group1171274964Controller.dispose(); } 
 }
