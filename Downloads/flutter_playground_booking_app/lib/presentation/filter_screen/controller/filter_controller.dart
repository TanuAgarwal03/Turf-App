import 'dart:convert';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/filter_screen/models/filter_model.dart';
import '../models/price_range_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class FilterController extends GetxController {
  List<PriceRangeModel> priceList = FilterModel.getPriceList();
  RxList<Map<String, dynamic>> filteredGrounds = <Map<String, dynamic>>[].obs;
  var currentCategory = Rxn<int>(); 
  int currentPrice = 1;
  int? selectedMinPrice;
  int? selectedMaxPrice;

  void setSelectedCategory(int? categoryId) {
    currentCategory.value = categoryId;
    print('Category on Tap : ${currentCategory.value}');
  }

  Future<void> fetchFilteredGrounds(
      {required int minPrice, required int maxPrice}) async {
    String url =
        'https://lytechxagency.website/turf/wp-json/wp/v1/price_filter?min_price=$minPrice&max_price=$maxPrice';
    if (currentCategory.value != null) {
      url += '&category_id=${currentCategory.value}';
    }
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      filteredGrounds.value = data.cast<Map<String, dynamic>>();
    } else {
      print('Failed to load data');
    }
  }

  void onSelectPriceRange(int id, int minPrice, int maxPrice) {
    currentPrice = id;
    selectedMinPrice = minPrice;
    selectedMaxPrice = maxPrice;
    fetchFilteredGrounds(minPrice: minPrice, maxPrice: maxPrice);
    update();
  }

  void resetFilters() {
    currentPrice = 0;
    selectedMinPrice = null;
    selectedMaxPrice = null;
    currentCategory.value = null; 
    filteredGrounds.clear();
  }
}

