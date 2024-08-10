
// import 'dart:convert';

import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/filter_screen/models/filter_model.dart';
import '../models/price_range_model.dart';
import 'package:http/http.dart' as http;

class FilterController extends GetxController {
 List<PriceRangeModel> priceList =  FilterModel.getPriceList();

  List<PriceRangeModel> filteredGrounds = <PriceRangeModel>[].obs;
 int currentPrice = 1;
 int currentGroundType = 1;
 Future<void> fetchFilteredGrounds() async {
    final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/price_filter?min_price=100&max_price=1200'));

    if (response.statusCode == 200) {
      // List<dynamic> data = json.decode(response.body);
      // filteredGrounds = data.map((item) => PriceRangeModel.fromJson(item)).toList();
      update();
    } else {
      print('Failed to load data');
    }
  }
}
// class FilterController extends GetxController {
//   int? selectedCategoryId;
//   int? currentPrice;

//   // This list will hold the fetched turf data.
//   List<TurfModel> filteredTurfs = [];

//   void setSelectedCategory(int id) {
//     selectedCategoryId = id;
//     update();
//   }

//   void setSelectedPriceRange(int id) {
//     currentPrice = id;
//     update();
//   }

//   Future<void> fetchFilteredTurfs() async {
//     if (selectedCategoryId != null && currentPrice != null) {
//       // Map the selected price range id to min and max price values
//       Map<String, String> priceRange = _getPriceRangeFromId(currentPrice!);
      
//       final response = await http.get(
//         Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/price_filter?min_price=${priceRange['min_price']}&max_price=${priceRange['max_price']}'),
//       );

//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//         filteredTurfs = data.map((item) => TurfModel.fromJson(item)).toList();
//         update();
//       } else {
//         // Handle error
//       }
//     }
//   }

//   Map<String, String> _getPriceRangeFromId(int id) {
//     // Example mapping, you can adjust the values as needed
//     switch (id) {
//       case 1:
//         return {'min_price': '100', 'max_price': '150'};
//       case 2:
//         return {'min_price': '150', 'max_price': '300'};
//       case 3:
//         return {'min_price': '300', 'max_price': '450'};
//       case 4:
//         return {'min_price': '450', 'max_price': '600'};
//       case 5:
//         return {'min_price': '600', 'max_price': '750'};
//       case 6:
//         return {'min_price': '750', 'max_price': '1000'};
//       default:
//         return {'min_price': '100', 'max_price': '1200'};
//     }
//   }
// }
