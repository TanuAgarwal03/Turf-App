import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/mygrounds_item_model.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

class MyGroundsController extends GetxController {
  var myGroundList = <MygroundsItemModel>[].obs;
  ApiService apiService = ApiService();
  @override
  void onInit() {
    super.onInit();
    fetchMyGrounds();
  }

  void fetchMyGrounds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int user_id = prefs.getInt('user_id') ?? 1;
    print(user_id);
    final response = await apiService.getAPI('get_turfs_ownerwise?user_id=$user_id');
    // final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_turfs_ownerwise?user_id=$user_id'));
    print('API called - response : ${response.body}');
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      myGroundList.value = data.map((ground) => MygroundsItemModel.fromJson(ground)).toList();
    } else {
      Get.snackbar('Error', 'Failed to load grounds');
    }
  }

}
