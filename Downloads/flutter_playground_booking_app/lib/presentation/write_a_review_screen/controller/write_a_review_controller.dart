import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/presentation/review_screen/controller/review_controller.dart';
import 'package:flutter_playground_booking_app/presentation/write_a_review_screen/models/write_a_review_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WriteAReviewController extends GetxController {
  TextEditingController reviewController = TextEditingController();
  RxInt rating = 0.obs;
  Rx<WriteAReviewModel> writeAReviewModelObj = WriteAReviewModel().obs;
  late int turfId;

  @override
  void onInit(){
    super.onInit();
    turfId = Get.arguments as int? ?? 0;
    print('Turf ID in WriteAReviewController: $turfId');
  }

  Future<void> submitReview() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('user_id');
      
      if (userId == null) {
        Get.snackbar('Error', 'User ID not found');
        return;
      }

      final url = Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/write_review?user_id=${userId}&post_id=$turfId&rating=${rating.value.toString()}&description=${reviewController.text}');
      final body = {
        'user_id': userId.toString(),
        'rating': rating.value.toString(),
        'description': reviewController.text,
      };

      final response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Review submitted successfully');
        Get.find<ReviewController>().fetchReviews(turfId);
        Get.back();
      } else {
        Get.snackbar('Success', 'Review submitted successfully');
        Get.find<ReviewController>().fetchReviews(turfId);
        Get.back();
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while submitting the review');
      print('Exception: $e');
    }
  }

  @override
  void onClose() {
    super.onClose();
    reviewController.dispose();
  }
}
