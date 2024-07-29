
/// A controller class for the BookingDetailsScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/booking_details_screen/models/booking_details_model.dart';

import '../models/notify_me_data.dart';

///
/// This class manages the state of the BookingDetailsScreen, including the
/// current bookingDetailsModelObj
class BookingDetailsController extends GetxController {
 List<BookingDetailsModel> notifyMeList = NotifyMeData.getNotifyData();
}
