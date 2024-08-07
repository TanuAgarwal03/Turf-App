import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/select_date_time_screen/models/select_date_time_model.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../models/selet_time_data.dart';

// class SelectDateTimeController extends GetxController {
//  List<SelectDateTimeModel> timeData = SelectTimeData.getTimeData();
//  int currentTime = 0;
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SelectDateTimeController extends GetxController {
  List<SelectDateTimeModel> timeData = SelectTimeData.getTimeData();

  RxInt currentTime = 0.obs;
  // final DateTime selectedDate = DateTime.now();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;
  RxString bookingMessage = ''.obs;

  final bookingDateController = TextEditingController();
  final timeFromController = TextEditingController();
  final timeToController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Future<void> createBooking() async {
    isLoading.value = true;
    final timeRange = timeData[currentTime.value].time!.split(' to ');
    
    final bookingRequest = {
      // 'booking_date': bookingDateController.text,
      'bookingDate': selectedDate.value.toIso8601String().split('T')[0],
      'timefrom': timeRange[0],
      'timeto': timeRange[1],
      'name': nameController.text,
      'phone_number': phoneNumberController.text,
    };

    isLoading(true);

    final response = await http.post(
      Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/turf_booking'),
      body: bookingRequest,
    );

    if (response.statusCode == 200) {
      final bookingResponse = json.decode(response.body);
      bookingMessage.value = bookingResponse['message'];
    } else {
      bookingMessage.value = 'Failed to create booking';
    }
    isLoading(false);
  }
}
