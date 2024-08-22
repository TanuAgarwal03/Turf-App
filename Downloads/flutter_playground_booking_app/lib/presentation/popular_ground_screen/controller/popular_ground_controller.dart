import 'dart:convert';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/models/popularground_item_model.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class PopularGroundController extends GetxController {
  var popularGround = <PopulargroundItemModel>[].obs;
  ApiService apiService = ApiService();
  RxString currentImage = ''.obs; 

  @override
  void onInit() {
    super.onInit();
    fetchPopularGroundData();
  }

Future<void> fetchPopularGroundData() async {
  // final url = 'https://lytechxagency.website/turf/wp-json/wp/v2/turf?&acf_format=standard';
  try {
    final response = await apiService.getApi('turf?&acf_format=standard');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      popularGround.value = data
          .map((json) => PopulargroundItemModel.fromJson(json as Map<String, dynamic>))
          .toList();
        } else {
      Get.snackbar("Error", "Failed to fetch data");
    }
  } catch (e) {
    print('Error occurred: $e');
    Get.snackbar("Error", "Failed to fetch data: $e");
  }
}


}