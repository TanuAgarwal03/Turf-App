import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/my_booking_upcoming_page/models/my_booking_upcoming_model.dart';

/// A controller class for the MyBookingUpcomingPage.
///
/// This class manages the state of the MyBookingUpcomingPage, including the
/// current myBookingUpcomingModelObj
// class MyBookingUpcomingController extends GetxController {
//   List<MyBookingUpcomingModel> getMybookingUpcoming =  MyBookingUpcomingData.getUpcomingData();
// }
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';

class MyBookingUpcomingController extends GetxController {
  var getMybookingUpcoming = <MyBookingUpcomingModel>[].obs;
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
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        getMybookingUpcoming.value = jsonResponse.map((booking) => MyBookingUpcomingModel.fromJson(booking)).toList();
      } else {
        // Handle error
        print('Error fetching data');
      }

      
    } finally {
      isLoading(false);
    }
  }
}

Future<void> _requestPhoneCallPermission() async {
  final status = await Permission.phone.status;
  if (!status.isGranted) {
    await Permission.phone.request();
  }
}
