import '../controller/events_detail_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EventsDetailScreen.
///
/// This class ensures that the EventsDetailController is created when the
/// EventsDetailScreen is first loaded.
class EventsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventsDetailController());
  }
}
