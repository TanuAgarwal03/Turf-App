import '../controller/my_booking_upcoming_tab_container_controller.dart';
import 'package:get/get.dart';

class MyBookingUpcomingTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyBookingUpcomingTabContainerController());
  }
}
