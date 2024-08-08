import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/my_booking_upcoming_page/models/my_booking_upcoming_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';

//only upcoming
// class MyBookingUpcomingController extends GetxController {
//   var getMybookingUpcoming = <MyBookingUpcomingModel>[].obs;
//   var isLoading = true.obs;

//   @override
//   void onInit() {
//     fetchMyBookingUpcoming();
//     super.onInit();
//     _requestPhoneCallPermission();
//   }
   
//   void fetchMyBookingUpcoming() async {
//     try {
//       isLoading(true);
//       var response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_booking_by_owner?author_id=1'));
//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body) as List;
//         getMybookingUpcoming.value = jsonResponse.map((booking) => MyBookingUpcomingModel.fromJson(booking)).toList();
//       } else {
//         // Handle error
//         print('Error fetching data');
//       }      
//     } finally {
//       isLoading(false);
//     }
//   }
// }

// Future<void> _requestPhoneCallPermission() async {
//   final status = await Permission.phone.status;
//   if (!status.isGranted) {
//     await Permission.phone.request();
//   }
// }

//History and upcoming

class MyBookingUpcomingController extends GetxController {
  var getMybookingUpcoming = <MyBookingUpcomingModel>[].obs;
  var getMybookingCompleted = <MyBookingUpcomingModel>[].obs; // Add this line
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMyBookingUpcoming();
    super.onInit();
    _requestPhoneCallPermission();
  }

  void fetchMyBookingUpcoming() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_booking_by_owner?author_id=1'));
            // var response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_booking_by_user?user_id=7'));

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


// Role is added 

// import 'package:flutter_playground_booking_app/core/app_export.dart';
// import 'package:flutter_playground_booking_app/presentation/my_booking_upcoming_page/models/my_booking_upcoming_model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyBookingUpcomingController extends GetxController {
//   var getMybookingUpcoming = <MyBookingUpcomingModel>[].obs;
//   var isLoading = true.obs;
//   String role = ''; // Add this field to store the role
//   int? userId;

//   @override
//   void onInit() {
//     super.onInit();
//     _loadRole(); // Load the role when the controller initializes
//     _requestPhoneCallPermission();
//   }

//   Future<void> _loadRole() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? responseBody = prefs.getString('login_response'); // Retrieve the stored response
//     int userId = prefs.getInt('user_id')?? 4;
//     if (responseBody != null) {
//       Map<String, dynamic> responseMap = jsonDecode(responseBody); // Parse the response
//       role = responseMap['role'] ?? ''; // Extract the role value
//       fetchMyBookingUpcoming(); // Fetch bookings based on the role
//     }
//   }

//   void fetchMyBookingUpcoming() async {
//     try {
//       isLoading(true);
//       print(' Current logged in role : $role');

//       String apiUrl;
//       if (role.isEmpty || role == 'owner') {
//         apiUrl = 'https://lytechxagency.website/turf/wp-json/wp/v1/get_booking_by_owner?author_id=1';
//       } else if (role == 'user') {
//         apiUrl = 'https://lytechxagency.website/turf/wp-json/wp/v1/get_booking_by_user?user_id=$userId';
//       } else {
//         print('Invalid role: $role');
//         return; 
//       }
//       var response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body) as List;
//         getMybookingUpcoming.value = jsonResponse.map((booking) => MyBookingUpcomingModel.fromJson(booking)).toList();
//       } else {
//         print('Error fetching data');
//       }      
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<void> _requestPhoneCallPermission() async {
//     final status = await Permission.phone.status;
//     if (!status.isGranted) {
//       await Permission.phone.request();
//     }
//   }
// }
