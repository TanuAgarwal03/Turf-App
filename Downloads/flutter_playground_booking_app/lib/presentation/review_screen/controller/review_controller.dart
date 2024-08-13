import 'package:flutter_playground_booking_app/presentation/review_screen/models/review_item_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

class ReviewController extends GetxController {
  RxList<ReviewItemModel> reviewList = <ReviewItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchReviews();
  }

 double get totalRating {
    double total = 0.0;
    for (var review in reviewList) {
      double rating = double.tryParse(review.rating) ?? 0.0;
      total += rating;
    }
    return total;
  }
  double get averageRating {
    if (totalReviews == 0) {
      return 0.0; 
    }
    double avg = totalRating / totalReviews;
    return double.parse(avg.toStringAsFixed(1));
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
