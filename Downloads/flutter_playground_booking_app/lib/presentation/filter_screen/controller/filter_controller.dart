
import 'dart:convert';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/filter_screen/models/filter_model.dart';
import '../models/price_range_model.dart';
import 'package:http/http.dart' as http;

class FilterController extends GetxController {
  List<PriceRangeModel> priceList = FilterModel.getPriceList();
  RxList<Map<String, dynamic>> filteredGrounds = <Map<String, dynamic>>[].obs;
  int currentPrice = 1;
   int? selectedMinPrice;
  int? selectedMaxPrice;
  Future<void> fetchFilteredGrounds({required int minPrice, required int maxPrice}) async {
    final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/price_filter?min_price=$minPrice&max_price=$maxPrice'));

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
    filteredGrounds.clear();
  }
}
// class FilterController extends GetxController {
//   var priceList = <PriceRangeModel>[].obs;
//   var currentPrice = ''.obs;
//   var filteredGrounds = <dynamic>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize your priceList and other data if needed
//     fetchFilteredGrounds();
//   }

//   void onSelectPriceRange(String id, double minPrice, double maxPrice) {
//     currentPrice.value = id;
//     fetchFilteredGrounds(minPrice, maxPrice);
//   }

//   void fetchFilteredGrounds([double? minPrice, double? maxPrice]) async {
//     // Fetch all turfs from API
//     var allGrounds = await fetchAllGroundsFromAPI();

//     // Filter turfs based on selected price range
//     filteredGrounds.value = allGrounds.where((ground) {
//       double price = double.parse(ground['acf']['price']);
//       print('Checking price: $price against range: $minPrice - $maxPrice');
//       if (minPrice != null && maxPrice != null) {
//         return price >= minPrice && price < maxPrice;
//       }
//       return true;
//     }).toList();
//   }

//   Future<List<dynamic>> fetchAllGroundsFromAPI() async {
//     // Replace with your API call logic
//     var response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/turflist'));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to load grounds');
//     }
//   }

//   void resetFilters() {
//     currentPrice.value = '';
//     fetchFilteredGrounds(); 
//   }
// }
