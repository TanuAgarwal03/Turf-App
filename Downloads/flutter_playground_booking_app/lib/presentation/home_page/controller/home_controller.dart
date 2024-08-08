import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_playground_booking_app/presentation/home_page/models/home_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  TextEditingController iclocationController = TextEditingController();
  TextEditingController iclocationController1 = TextEditingController();
  List<HomeModel> homeModelList = [];

  Future<List<HomeModel>> turfList() async {
    // String url = 'get-turf/18';
    // String url = 'https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/18';

    try {
      final response = await http.get(
        Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/18'),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        
        homeModelList.clear();
        homeModelList.add(HomeModel.fromJson(jsonResponse));

        print("This is homeModelList : $homeModelList");
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
    return homeModelList;
  }
}
