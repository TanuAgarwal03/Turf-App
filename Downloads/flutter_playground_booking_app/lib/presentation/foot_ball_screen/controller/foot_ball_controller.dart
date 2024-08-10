
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/presentation/foot_ball_screen/models/foot_ball_data.dart';
import 'package:flutter_playground_booking_app/presentation/foot_ball_screen/models/foot_ball_model.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

class FootBallController extends GetxController {
  var footBallList = <FootBallModel>[].obs;
  ApiService apiService = ApiService();
  var isLoading = true.obs;


Future<void> fetchFootBallData(int categoryId) async {
  isLoading(true);
  print('method called with categoryId: $categoryId');
  final response = await apiService.getApi('turf?&acf_format=standard&categories=$categoryId');
  print(response.body);
  
  if (response.statusCode == 200) {
    print("API called successfully");
    final List<dynamic> data = json.decode(response.body);
    footBallList.value = data.map((item) => FootBallModel.fromJson(item)).toList();
    isLoading(false);
  } else {
    print('Error fetching data');
    footBallList.value = FootBallData.getFootBollData();
  }
}
}