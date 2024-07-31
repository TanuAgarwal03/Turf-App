// import 'package:flutter_playground_booking_app/core/app_export.dart';
// import 'package:flutter_playground_booking_app/presentation/write_a_review_screen/models/write_a_review_model.dart';
// import 'package:flutter/material.dart';

// /// A controller class for the WriteAReviewScreen.
// ///
// /// This class manages the state of the WriteAReviewScreen, including the
// /// current writeAReviewModelObj
// // class WriteAReviewController extends GetxController {TextEditingController group1171274964Controller = TextEditingController();

// // Rx<WriteAReviewModel> writeAReviewModelObj = WriteAReviewModel().obs;

// // @override void onClose() { super.onClose(); group1171274964Controller.dispose(); }
// //  }
// // import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class WriteAReviewController extends GetxController {
//   TextEditingController reviewController = TextEditingController();

//   Rx<WriteAReviewModel> writeAReviewModelObj = WriteAReviewModel().obs;

//   @override
//   void onClose() {
//     super.onClose();
//     reviewController.dispose();
//   }

//   Future<void> submitReview(String userId, String postId, String rating) async {
//     final url = Uri.parse(
//         'https://lytechxagency.website/turf/wp-json/wp/v1/write_review?user_id=${userId}&post_id=$postId&rating=$rating&description=${reviewController.text}');
//     final body = {
//       'user_id': userId,
//       'post_id': postId,
//       'rating': rating,
//       'description': reviewController.text,
//     };

//     final response = await http.post(url, body: body);

//     if (response.statusCode == 200) {
//       Get.snackbar('Success', 'Review submitted successfully');
//       Get.back();
//     } else {
//       Get.snackbar('Error', 'Failed to submit review');
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/presentation/write_a_review_screen/models/write_a_review_model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class WriteAReviewController extends GetxController {
//   TextEditingController reviewController = TextEditingController();

//   Rx<WriteAReviewModel> writeAReviewModelObj = WriteAReviewModel().obs;

//   @override
//   void onClose() {
//     super.onClose();
//     reviewController.dispose();
//   }

//   Future<void> submitReview() async {
//     final prefs = await SharedPreferences.getInstance();
//     int? userId = prefs.getInt('user_id');
//     // Generate postId based on your logic, here it's just a placeholder
//     // String postId = DateTime.now().millisecondsSinceEpoch.toString();
    
//     if (userId == null) {
//       Get.snackbar('Error', 'User ID not found');
//       return;
//     }

//     final url = Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/write_review?user_id=${userId}&post_id=5&rating=1&description=${reviewController.text}');
//     final body = {
//       'user_id': userId.toString(),
//       // 'post_id': postId,
//       'description': reviewController.text,
//     };

//     final response = await http.post(url, body: body);
//     print(response.body);

//     if (response.statusCode == 200) {
//       print(response.body);
//       Get.snackbar('Success', 'Review submitted successfully');
//       Get.back();
//     } else {
//       Get.snackbar('Error', 'Failed to submit review');
//       print(response.body);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/presentation/review_screen/controller/review_controller.dart';
import 'package:flutter_playground_booking_app/presentation/write_a_review_screen/models/write_a_review_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WriteAReviewController extends GetxController {
  TextEditingController reviewController = TextEditingController();

  Rx<WriteAReviewModel> writeAReviewModelObj = WriteAReviewModel().obs;

  @override
  void onClose() {
    super.onClose();
    reviewController.dispose();
  }

  Future<void> submitReview() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('user_id');
    
    if (userId == null) {
      Get.snackbar('Error', 'User ID not found');
      return;
    }

    final url = Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/write_review?user_id=${userId}&post_id=5&rating=1&description=${reviewController.text}');
    final body = {
      'user_id': userId.toString(),
      // 'post_id': postId,
      'description': reviewController.text,
    };

    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Review submitted successfully');
      Get.find<ReviewController>().fetchReviews();
      Get.back();
    } else {
      Get.snackbar('Error', 'Failed to submit review');
    }
  }
}
