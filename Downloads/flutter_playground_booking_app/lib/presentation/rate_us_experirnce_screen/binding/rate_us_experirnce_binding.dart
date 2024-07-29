import '../controller/rate_us_experirnce_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RateUsExperirnceScreen.
///
/// This class ensures that the RateUsExperirnceController is created when the
/// RateUsExperirnceScreen is first loaded.
class RateUsExperirnceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RateUsExperirnceController());
  }
}
