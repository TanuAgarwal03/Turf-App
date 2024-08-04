import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import '../models/eventsdetail_item_model.dart';
import 'package:http/http.dart' as http;

// class EventsDetailController extends GetxController {
//  List<EventsdetailItemModel> previouseMemory = EventsDetailModel.getPreviousMemoryList();
//  PageController pageController = PageController();
//  int currentPage = 0;
//  int currentGround = 0;
// }
class EventsDetailController extends GetxController {
  List<EventsdetailItemModel> previouseMemory = [];
  PageController pageController = PageController();
  int currentPage = 0;
  int currentGround = 0;
  // String eventTitle = '';

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  void fetchEvents() async {
    try {
      final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v2/events?&acf_format=standard'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        previouseMemory = data.map((item) => EventsdetailItemModel.fromJson(item)).toList();
        // if (previouseMemory.isNotEmpty) {
        //   eventTitle = previouseMemory[0].title ?? 'Event Title';
        //   // eventTitle = json['acf']['description'];
        // } 
        update();
      } else {
        // Handle error
        print('Failed to load events');
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }
}
