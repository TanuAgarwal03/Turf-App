import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../models/events_item_model.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventsController extends GetxController {
  List<EventsItemModel> eventDataList = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchEventsData();
    fetchEventsData();
  }

  Future<void> fetchEventsData() async {
    isLoading(true);
    final response = await http.get(
      Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/events?&acf_format=standard'),
    );
    await Future.delayed(Duration(seconds:2));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      eventDataList = data.map((item) => EventsItemModel.fromJson(item)).toList();
      update();
    } else {
      isLoading(false);
      throw Exception('Failed to load events');
    }
  }
}
