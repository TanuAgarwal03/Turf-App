import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/select_date_time_screen/models/select_date_time_model.dart';
import '../models/selet_time_data.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SelectDateTimeController extends GetxController {
  List<SelectDateTimeModel> timeData = SelectTimeData.getTimeData();

  RxInt currentTime = 0.obs;
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
