import '../controller/events_detail_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EventsDetailTwoScreen.
///
/// This class ensures that the EventsDetailTwoController is created when the
/// EventsDetailTwoScreen is first loaded.
class EventsDetailTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventsDetailTwoController());
  }
}
