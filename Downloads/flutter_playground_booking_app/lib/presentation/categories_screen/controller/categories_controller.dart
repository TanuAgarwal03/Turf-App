// // import 'package:flutter_playground_booking_app/core/app_export.dart';
// // import 'package:flutter_playground_booking_app/presentation/categories_screen/models/categories_model.dart';

// // import '../models/categories_item_model.dart';

// // /// A controller class for the CategoriesScreen.
// // ///
// // /// This class manages the state of the CategoriesScreen, including the
// // /// current categoriesModelObj
// // class CategoriesController extends GetxController {
// //  // List<CategoriesItemModel> categoriesItemList()
// //    List<CategoriesItemModel> categoriesData = CategoriesModel.categoriesItemList();
// // }
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../models/categories_item_model.dart';

// class CategoriesController extends GetxController {
//   RxList<CategoriesItemModel> categoriesData = <CategoriesItemModel>[].obs;
//   RxList<CategoriesItemModel> turfData = <CategoriesItemModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//     fetchTurfData();
//   }

//   Future<void> fetchCategories() async {
//     final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/categories'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       categoriesData.value = data.map((json) => CategoriesItemModel.fromJson(json)).toList();
//     } else {
//       // Handle error
//       print('Failed to load categories');
//     }
//   }

//   Future<void> fetchTurfData() async {
//     final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/turf?categories=10'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       turfData.value = data.map((json) => CategoriesItemModel.fromJson(json)).toList();
//     } else {
//       // Handle error
//       print('Failed to load turf data');
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:get/get.dart';
import '../models/categories_item_model.dart';
import 'package:http/http.dart' as http;

class CategoriesController extends GetxController {
  RxList<CategoriesItemModel> categoriesData = <CategoriesItemModel>[].obs;
  RxList<CategoriesItemModel> turfData = <CategoriesItemModel>[].obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/categories'));
      // final response = await apiService.getAPI('categories');
      if (response.statusCode == 200) {
        // print('Category data : ${response.body}');
        final List<dynamic> data = json.decode(response.body);
        categoriesData.value = data.map((json) => CategoriesItemModel.fromJson(json)).toList();
        // Optionally fetch turf data for the first category or handle it as needed
        if (categoriesData.isNotEmpty) {
          fetchTurfDataByCategory(categoriesData.first.id!); // Ensure id is not null
        }
      } else {
        print('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> fetchTurfDataByCategory(String categoryId) async {
    try {
      final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/turf?categories=$categoryId'));
      // final response = await apiService.getAPI('turf?categories=$categoryId');
      if (response.statusCode == 200) {
        // print('Turf response : ${response.body}');
        final List<dynamic> data = json.decode(response.body);
        turfData.value = data.map((json) => CategoriesItemModel.fromJson(json)).toList();
      } else {
        print('Failed to load turf data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching turf data: $e');
    }
  }
}

// import 'dart:convert';
// import 'package:flutter_playground_booking_app/config/app_config.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../models/categories_item_model.dart';

// class CategoriesController extends GetxController {
//   RxList<CategoriesItemModel> categoriesData = <CategoriesItemModel>[].obs;
//   RxList<CategoriesItemModel> turfData = <CategoriesItemModel>[].obs;
//   final ApiService apiService = ApiService();
//   @override
//   void onInit() {
//     super.onInit();
//     fetchCategories();
//     fetchTurfData();
//   }

//   Future<void> fetchCategories() async {
//     // final response = await apiService.getAPI('categories');
//     final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/categories'));
//     if (response.statusCode == 200) {
//       print('Category data : ${response.body}');
//       final List<dynamic> data = json.decode(response.body);
//       categoriesData.value = data.map((json) => CategoriesItemModel.fromJson(json)).toList();
//     } else {
//       // Handle error
//       print('Failed to load categories');
//     }
//   }

//   Future<void> fetchTurfData() async {
//     final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/turf?categories=10'));
//     if (response.statusCode == 200) {
//       print('Turf response : ${response.body}');
//       final List<dynamic> data = json.decode(response.body);
//       turfData.value = data.map((json) => CategoriesItemModel.fromJson(json)).toList();
//     } else {
//       // Handle error
//       print('Failed to load turf data');
//     }
//   }
// }



// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';

// class CategoriesController extends GetxController {
//   RxList<CategoriesItemModel> categoriesData = <CategoriesItemModel>[].obs;
//   List<int> categoryIds = []; // Store category IDs here

//   Future<void> fetchCategories() async {
//     final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/categories'));
//     if (response.statusCode == 200) {
//       print('Category data : ${response.body}');
//       final List<dynamic> data = json.decode(response.body);

//       // Parse the categories and extract IDs
//       categoriesData.value = data.map((json) => CategoriesModel.fromJson(json)).toList();

//       // Save category IDs
//       categoryIds = data.map<int>((json) => json['id'] as int).toList();
//       print('Category IDs: $categoryIds');
//     } else {
//       // Handle error
//       print('Failed to load categories');
//     }
//   }

//   Future<void> fetchTurfDataByCategory(int categoryId) async {
//     final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/turf?categories=$categoryId'));
//     if (response.statusCode == 200) {
//       print('Turf data for category $categoryId: ${response.body}');
//       // Handle the response data for the filtered category
//     } else {
//       // Handle error
//       print('Failed to load turf data for category $categoryId');
//     }
//   }
// }
