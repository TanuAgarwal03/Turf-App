import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/my_booking_upcoming_page/models/my_booking_upcoming_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBookingUpcomingController extends GetxController {
  var getMybookingUpcoming = <MyBookingUpcomingModel>[].obs;
  var getMybookingCompleted = <MyBookingUpcomingModel>[].obs; // Add this line
  var isLoading = true.obs;
  ApiService apiService = ApiService();
  String role = '';

  @override
  void onInit() {
    fetchUserProfile();
    _loadRole();
    fetchMyBookingUpcoming();
    super.onInit();
    _requestPhoneCallPermission();
  }
  void fetchUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('user_id') ?? 0;
      print(userId);
    }

     Future<void> _loadRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? responseBody = prefs.getString('login_response'); 
    if (responseBody != null) {
      Map<String, dynamic> responseMap = jsonDecode(responseBody); 
      role = responseMap['role'] ?? ''; 
      fetchMyBookingUpcoming(); 
    }
  }
  
  void fetchMyBookingUpcoming() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('user_id') ?? 0;
      isLoading(true);
      print(role);
      var response =(role=='owner') ? await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_booking_by_owner?author_id=$userId')) : await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_booking_by_user?user_id=$userId'));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        var bookings = jsonResponse.map((booking) => MyBookingUpcomingModel.fromJson(booking)).toList();
        getMybookingUpcoming.value = bookings;
        
        DateTime now = DateTime.now();
        getMybookingCompleted.value = bookings.where((booking) {
          DateTime bookingDate = DateTime.parse(booking.bookingDate);
          return bookingDate.isBefore(now);
        }).toList();
      } else {
        // Handle error
        print('Error fetching data');
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> _requestPhoneCallPermission() async {
    final status = await Permission.phone.status;
    if (!status.isGranted) {
      await Permission.phone.request();
    }
  }
}

