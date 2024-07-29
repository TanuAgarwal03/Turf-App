import '../controller/booking_details_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BookingDetailsOneScreen.
///
/// This class ensures that the BookingDetailsOneController is created when the
/// BookingDetailsOneScreen is first loaded.
class BookingDetailsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingDetailsOneController());
  }
}
