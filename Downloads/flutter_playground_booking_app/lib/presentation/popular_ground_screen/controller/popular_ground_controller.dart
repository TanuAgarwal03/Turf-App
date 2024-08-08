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
  final url = 'https://lytechxagency.website/turf/wp-json/wp/v2/turf?&acf_format=standard';
  print('Calling API: $url');

  try {
    final response = await http.get(Uri.parse(url));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      print('Type of data: ${data.runtimeType}');

      popularGround.value = data
          .map((json) => PopulargroundItemModel.fromJson(json as Map<String, dynamic>))
          .toList();
      print('List of popular grounds: ${popularGround.length}');
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