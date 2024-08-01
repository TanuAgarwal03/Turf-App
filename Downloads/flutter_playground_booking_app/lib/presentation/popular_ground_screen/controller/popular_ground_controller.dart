// import 'package:flutter_playground_booking_app/core/app_export.dart';
// // import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/models/popular_ground_model.dart';

// import '../models/popularground_item_model.dart';

// // class PopularGroundController extends GetxController {
// //   List<PopulargroundItemModel> populerGround =
// //       PopularGroundModel.getPopularGroundData();
// // String currentimage = "";
// // }
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';

// class PopularGroundController extends GetxController {
//   var popularGround = <PopulargroundItemModel>[].obs;
//   String currentImage = "";

//   @override
//   void onInit() {
//     super.onInit();
//     fetchPopularGroundData();
//   }

//   void fetchPopularGroundData() async {
//     final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/turf'));
//     if (response.statusCode == 200) {
//       print(response.body);
//       var data = jsonDecode(response.body) as List;
//       popularGround.value = data.map((json) => PopulargroundItemModel.fromJson(json)).toList();
//     } else {
//       // Handle error
//       Get.snackbar("Error", "Failed to fetch data");
//     }
//   }
// }
import 'dart:convert';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/models/popularground_item_model.dart';
import 'package:http/http.dart' as http;

class PopularGroundController extends GetxController {
  RxString currentImage = ''.obs; 
  var popularGround = <PopulargroundItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPopularGroundData();
  }

  void fetchPopularGroundData() async {
    final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/turf'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      popularGround.value = data.map((json) => PopulargroundItemModel.fromJson(json)).toList();
    } else {
      // Handle error
      Get.snackbar("Error", "Failed to fetch data");
    }
  }
}
