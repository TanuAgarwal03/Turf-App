
import 'dart:convert';

import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/filter_screen/models/filter_model.dart';
import '../models/price_range_model.dart';
import 'package:http/http.dart' as http;

class FilterController extends GetxController {
 List<PriceRangeModel> priceList =  FilterModel.getPriceList();

  List<PriceRangeModel> filteredGrounds = <PriceRangeModel>[].obs;
//  List<GroundTypeModel> groundList =  FilterModel.getGroundTypeDataList();
 int currentPrice = 1;
 int currentGroundType = 1;
 Future<void> fetchFilteredGrounds() async {
    final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/price_filter?min_price=100&max_price=1200'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      // filteredGrounds = data.map((item) => PriceRangeModel.fromJson(item)).toList();
      update();
    } else {
      // Handle error
      print('Failed to load data');
    }
  }
}
