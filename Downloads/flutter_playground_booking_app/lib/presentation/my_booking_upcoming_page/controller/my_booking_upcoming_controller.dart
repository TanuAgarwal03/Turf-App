import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/my_booking_upcoming_page/models/my_booking_upcoming_model.dart';

import '../models/my_booking_upcoming_data.dart';

/// A controller class for the MyBookingUpcomingPage.
///
/// This class manages the state of the MyBookingUpcomingPage, including the
/// current myBookingUpcomingModelObj
class MyBookingUpcomingController extends GetxController {
  List<MyBookingUpcomingModel> getMybookingUpcoming =  MyBookingUpcomingData.getUpcomingData();
}
