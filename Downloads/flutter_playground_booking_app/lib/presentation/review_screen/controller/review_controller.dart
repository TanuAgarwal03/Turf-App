// import 'package:flutter_playground_booking_app/presentation/detail_screen/models/detail_model.dart';
import 'package:flutter_playground_booking_app/presentation/review_screen/models/review_item_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewController extends GetxController {
  RxList<ReviewItemModel> reviewList = <ReviewItemModel>[].obs;
  final ReviewItemModel reviewModel = ReviewItemModel(id: '', title: '', rating: '', description: '', firstName: '', lastName: '', status: '');
  // final DetailModel detailModel = DetailModel(
  //   id: 0,
  //   title: '',
  //   description: '',
  //   image: '',
  //   address: '',
  //   price: '',
  //   locationUrl: '',
  //   facilities: [],
  //   reviews: [],
  //   galleryImages: []
  //   // images: []
  // );
  late int turfId;

  @override
  void onInit() {
    super.onInit();
    turfId = (Get.arguments as Map<String, int?>)['id'] ?? 0;
    print('Turf id in review controller : $turfId');
    fetchReviews(turfId);
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

  // Future<void> fetchReviews(int turfId) async {
  //   // final url = Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_all_review_owner?post_author=1');
  //   final url = Uri.parse(
  //       'https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/$turfId');

  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     // final data = json.decode(response.body);
  //     // print('API response in review page : $data');
  //     // List<dynamic> reviews =
  //     //     data['review'];
  //     //     print(data['review']);
  //     // reviewList.value =
  //     //     reviews.map((review) => ReviewItemModel.fromJson(review)).toList();

  //     List<dynamic> reviews = json.decode(response.body);
  //     print(' reviews :: $reviews');
  //     reviewList.value = reviews.map((review) => ReviewItemModel.fromJson(review)).toList();
  //   } else {
  //     Get.snackbar('Error', 'Failed to fetch reviews');
  //   }
  // }
  Future<void> fetchReviews(int turfId) async {
  final url = Uri.parse(
      'https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/$turfId');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print('API response in review page: $data');
    final reviewsData = data['review'];

    if (reviewsData is List) {
      // Handle the case where 'review' is a list
      reviewList.value = reviewsData.map((review) {
        return ReviewItemModel.fromJson(review as Map<String, dynamic>);
      }).toList();
    } else if (reviewsData is Map) {
      // Handle the case where 'review' is a single object
      reviewList.value = [ReviewItemModel.fromJson(reviewsData.cast<String, dynamic>())];
    } else {
      // Handle the case where 'review' is null or an unexpected type
      reviewList.clear();
    }
  } else {
    Get.snackbar('Error', 'Failed to fetch reviews');
  }
}
  int get totalReviews => reviewList.length;
}
