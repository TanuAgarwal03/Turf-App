import 'dart:convert';
import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/models/popularground_item_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopularGroundController extends GetxController {
  var popularGround = <PopulargroundItemModel>[].obs;
  RxString currentImage = ''.obs; 

  @override
  void onInit() {
    super.onInit();
    fetchPopularGroundData();
  }

  Future<void> fetchPopularGroundData() async {
  // final url = 'https://lytechxagency.website/turf/wp-json/wp/v1/turflist';
  final url = 'https://lytechxagency.website/turf/wp-json/wp/v2/turf?&acf_format=standard';
  print('Calling API: $url');

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('API called successfully');
      var data = jsonDecode(response.body);      
      if (data is List) {
        popularGround.value = data.map((json) => PopulargroundItemModel.fromJson(json)).toList();
      } else {
        Get.snackbar("Error", "Unexpected data format");
      }
    } else {
      print('Failed to fetch data: ${response.statusCode}');
      Get.snackbar("Error", "Failed to fetch data");
    }
  } catch (e) {
    print('Error occurred: $e');
    Get.snackbar("Error", "Failed to fetch data: $e");
  }
}

}

