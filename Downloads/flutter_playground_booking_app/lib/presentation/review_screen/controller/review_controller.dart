// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// // import '../models/review_item_model.dart';

// class ReviewController extends GetxController {
//   RxList<ReviewItemModel> reviewList = <ReviewItemModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchReviews();
//   }

//   Future<void> fetchReviews() async {
//     final url = Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/reviews');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       // Parse the response and update the reviewList
//       // Assuming response body is a list of reviews
//       List<dynamic> reviews = response.body as List;
//       reviewList.value = reviews.map((review) => ReviewItemModel.fromJson(review)).toList();
//     } else {
//       Get.snackbar('Error', 'Failed to fetch reviews');
//     }
//   }
// }
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
}
