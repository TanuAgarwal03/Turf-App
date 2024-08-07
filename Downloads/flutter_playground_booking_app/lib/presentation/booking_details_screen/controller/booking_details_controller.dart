
/// A controller class for the BookingDetailsScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/booking_details_screen/models/booking_details_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
///
/// This class manages the state of the BookingDetailsScreen, including the
/// current bookingDetailsModelObj
// class BookingDetailsController extends GetxController {
//  List<BookingDetailsModel> notifyMeList = NotifyMeData.getNotifyData();
// }
class BookingDetailsController extends GetxController {
  var bookingList = <BookingDetailsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBookingDetails();
  }

  void fetchBookingDetails() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_booking_by_owner?author_id=1'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        bookingList.value = data.map((json) => BookingDetailsModel.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load booking details');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading(false);
    }
  }
}