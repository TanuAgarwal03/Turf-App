import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../models/events_item_model.dart';

/// A controller class for the EventsPage.
///
/// This class manages the state of the EventsPage, including the
/// current eventsModelObj
// class EventsController extends GetxController {
//  List<EventsItemModel> eventDataList = EventsModel.getEventsData();
// }
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventsController extends GetxController {
  List<EventsItemModel> eventDataList = [];

  @override
  void onInit() {
    super.onInit();
    fetchEventsData();
  }

  Future<void> fetchEventsData() async {
    final response = await http.get(
      Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/events?&acf_format=standard'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      eventDataList = data.map((item) => EventsItemModel.fromJson(item)).toList();
      update();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
