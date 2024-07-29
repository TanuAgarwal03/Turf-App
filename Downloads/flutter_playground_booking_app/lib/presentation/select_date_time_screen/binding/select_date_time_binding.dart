import '../controller/select_date_time_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectDateTimeScreen.
///
/// This class ensures that the SelectDateTimeController is created when the
/// SelectDateTimeScreen is first loaded.
class SelectDateTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectDateTimeController());
  }
}
