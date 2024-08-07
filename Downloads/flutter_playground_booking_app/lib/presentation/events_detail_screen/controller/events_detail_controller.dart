import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import '../models/eventsdetail_item_model.dart';
import 'package:http/http.dart' as http;

class EventsDetailController extends GetxController {
  List<EventsdetailItemModel> previouseMemory = [];
  PageController pageController = PageController();
  int currentPage = 0;
  int currentGround = 0;
  EventsdetailItemModel? eventDetail;
  var loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  void fetchEvents() async {
    loading.value = true;
    try {
      final response = await http.get(Uri.parse(
          'https://lytechxagency.website/turf/wp-json/wp/v2/events?&acf_format=standard'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          eventDetail = EventsdetailItemModel.fromJson(data[0]);        
        }
        update();
      } else {
        print('Failed to load events');
      }
    } catch (e) {
      print('Error: $e');
    }finally {
      loading.value = false;
    }
  }
}
