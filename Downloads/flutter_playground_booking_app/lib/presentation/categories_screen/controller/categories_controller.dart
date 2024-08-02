import 'dart:convert';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:get/get.dart';
import '../models/categories_item_model.dart';
// import 'package:http/http.dart' as http;

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
      final response = await apiService.getApi('categories');
      // final response = await http.get(Uri.parse(
      //     'https://lytechxagency.website/turf/wp-json/wp/v2/categories'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        categoriesData.value =
            data.map((json) => CategoriesItemModel.fromJson(json)).toList();
        if (categoriesData.isNotEmpty) {
          fetchTurfDataByCategory(categoriesData.first.id);
          Get.snackbar('Category list', 'loaded successfully');
        }
      } else {
        print('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> fetchTurfDataByCategory(int categoryId) async {
    try {
      final response = await apiService.getApi('turf?&acf_format=standard&categories=$categoryId');
      // final response = await http.get(Uri.parse(
      //     'https://lytechxagency.website/turf/wp-json/wp/v2/turf?&acf_format=standard&categories=$categoryId'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        turfData.value =
            data.map((json) => CategoriesItemModel.fromJson(json)).toList();
      } else {
        print('Failed to load turf data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching turf data: $e');
    }
  }
}
