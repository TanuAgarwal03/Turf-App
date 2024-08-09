import 'package:flutter_playground_booking_app/presentation/review_screen/models/review_item_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewController extends GetxController {
  RxList<ReviewItemModel> reviewList = <ReviewItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    final url = Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_all_review_owner?post_author=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> reviews = json.decode(response.body);
      reviewList.value = reviews.map((review) => ReviewItemModel.fromJson(review)).toList();
    } else {
      Get.snackbar('Error', 'Failed to fetch reviews');
    }
  }
  int get totalReviews => reviewList.length;
}

// class ReviewController extends GetxController {
//   RxList<ReviewItemModel> reviewList = <ReviewItemModel>[].obs;
//   RxDouble averageRating = 0.0.obs;
//   RxInt totalReviews = 0.obs; // To store the total number of reviews

//   @override
//   void onInit() {
//     super.onInit();
//     fetchReviews();
//   }

//   Future<void> fetchReviews() async {
//     final url = Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_all_review_owner?post_author=1');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       List<dynamic> reviews = json.decode(response.body);
//       reviewList.value = reviews.map((review) => ReviewItemModel.fromJson(review)).toList();
//       calculateAverageRating();
//       totalReviews.value = reviewList.length; // Update totalReviews
//     } else {
//       Get.snackbar('Error', 'Failed to fetch reviews');
//     }
//   }

//   void calculateAverageRating() {
//     if (reviewList.isNotEmpty) {
//       double totalRating = reviewList.fold(0.0, (sum, review) => sum + review.rating);
//       averageRating.value = totalRating / reviewList.length;
//     } else {
//       averageRating.value = 0.0;
//     }
//   }
// }