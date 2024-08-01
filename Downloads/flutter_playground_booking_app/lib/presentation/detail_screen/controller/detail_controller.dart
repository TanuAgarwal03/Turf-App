import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../models/detail_model.dart';
import '../models/detailscreen_item_model.dart';
import '../models/ground_list_model.dart';
// import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

class DetailController extends GetxController {
  var isLoading = true.obs;
  final Rx<DetailModel> detailModel = DetailModel(
    id: 0,
    title: '',
    description: '',
    image: '',
    address: '',
    price: '',
    locationUrl: '',
    facilities: [],
    groundList: [],
    reviews: [],
  ).obs;

  final RxList<DetailscreenItemModel> facilityList =
      <DetailscreenItemModel>[].obs;
  final RxList<GroundListModel> groundList = <GroundListModel>[].obs;
  ApiService apiService = ApiService();

  PageController pageController = PageController();
  int currentPage = 0;
  int currentGround = 0;
  @override
  void onInit() {
    super.onInit();
    fetchTurfData();
  }

  Future<void> fetchTurfData() async {
    print('Fetching data..');
    try {
      isLoading(true);
      final response = await apiService.getAPI('get-turf/18');
      // final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/18'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        detailModel.value = DetailModel.fromJson(data);
        print('Loading data');
        facilityList.value =
            DetailscreenItemModel.fromFacilities(detailModel.value.facilities);
        groundList.value = detailModel.value.groundList;
      } else {
        Get.snackbar("Error", "Failed to load data");
      }
    } finally {
      isLoading(false);
    }
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_playground_booking_app/config/app_config.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';

// import '../models/detail_model.dart';
// import '../models/detailscreen_item_model.dart';
// import '../models/ground_list_model.dart';
// // import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'dart:convert';

// class DetailController extends GetxController {
  
//   final Rx<DetailModel> detailModel = DetailModel(
//     id: 0,
//     title: '',
//     description: '',
//     image: '',
//     address: '',
//     price: '',
//     locationUrl: '',
//     facilities: [],
//     groundList: [],
//     reviews: [],
//   ).obs;

//   final RxList<DetailscreenItemModel> facilityList = <DetailscreenItemModel>[].obs;
//   final RxList<GroundListModel> groundList = <GroundListModel>[].obs;
//   ApiService apiService = ApiService();

//   PageController pageController = PageController();
//   int currentPage = 0;
//   int currentGround = 0;
//   @override
//   void onInit() {
//     super.onInit();
//     fetchTurfIdAndDetails();
//   }

//   Future<void> fetchTurfIdAndDetails() async {
//     try {
//       // Fetch the list of turfs
//       final turfsResponse = await apiService.getAPI('https://lytechxagency.website/turf/wp-json/wp/v2/turf');
//       if (turfsResponse.statusCode == 200) {
//         final turfsData = jsonDecode(turfsResponse.body) as List;
//         // Extract the ID from the first turf item (or handle as needed)
//         final turfId = turfsData.isNotEmpty ? turfsData[0]['id'] as int : 0;
        
//         // Fetch details using the extracted ID
//         final detailResponse = await apiService.getAPI('https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/$turfId');
//         if (detailResponse.statusCode == 200) {
//           final detailData = jsonDecode(detailResponse.body);
//           detailModel.value = DetailModel.fromJson(detailData);

//           facilityList.value = DetailscreenItemModel.fromFacilities(detailModel.value.facilities);
//           groundList.value = detailModel.value.groundList;
//         } else {
//           Get.snackbar("Error", "Failed to load details");
//         }
//       } else {
//         Get.snackbar("Error", "Failed to fetch turfs");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "An error occurred: $e");
//     }
//   }
// }
