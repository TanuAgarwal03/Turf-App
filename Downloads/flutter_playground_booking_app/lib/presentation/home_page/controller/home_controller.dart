// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// /// A controller class for the HomePage.
// import 'package:flutter_playground_booking_app/core/app_export.dart';
// import 'package:flutter_playground_booking_app/presentation/home_page/models/home_model.dart';

// ///
// /// This class manages the state of the HomePage, including the
// /// current homeModelObj
// class HomeController extends GetxController {

//   TextEditingController searchController = TextEditingController();

//   TextEditingController iclocationController = TextEditingController();

//   TextEditingController iclocationController1 = TextEditingController();


//   List<HomeModel> homeModelList=[];


//   Future<List<HomeModel>> turfList() async {
//     String url =
//         'https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/18';
        
//     try {
//       final response = await http.get(
//         Uri.parse(url),
//       );

//      if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         homeModelList = jsonResponse.map((data) => HomeModel.fromJson(data)).toList();

//         print("This is homeModelList : $homeModelList");
//       } else {
//         print('Failed to load data');
//       }
//     } catch (e) {
//       // errorMessage.value = 'An error occurred: $e';
//        print('Error: $e');
//     }
//      return homeModelList;
//   }
// }


// import 'dart:convert';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_playground_booking_app/presentation/home_page/models/home_model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class HomeController extends GetxController {
//   TextEditingController searchController = TextEditingController();
//   TextEditingController iclocationController = TextEditingController();
//   TextEditingController iclocationController1 = TextEditingController();

//   List<HomeModel> homeModelList = [];

//   Future<List<HomeModel>> turfList() async {
//     String url = 'https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/18';

//     try {
//       final response = await http.get(
//         Uri.parse(url),
//       );

//       if (response.statusCode == 200) {
//         Map<String, dynamic> jsonResponse = json.decode(response.body);

//         // Clear the list before adding new data
//         homeModelList.clear();

//         // Add the single object to the list
//         homeModelList.add(HomeModel.fromJson(jsonResponse));

//         // Print the list of HomeModel instances
//         homeModelList.forEach((homeModel) {
//           print("HomeModel: $homeModel");
//         });
//       } else {
//         print('Failed to load data');
//       }
//     } catch (e) {
//       // errorMessage.value = 'An error occurred: $e';
//       print('Error: $e');
//     }
//     return homeModelList;
//   }
// }

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
    String url = 'https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/18';

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        
        // Clear the list before adding new data
        homeModelList.clear();
        
        // Add the single object to the list
        homeModelList.add(HomeModel.fromJson(jsonResponse));

        print("This is homeModelList : $homeModelList");
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      // errorMessage.value = 'An error occurred: $e';
      print('Error: $e');
    }
    return homeModelList;
  }
}
