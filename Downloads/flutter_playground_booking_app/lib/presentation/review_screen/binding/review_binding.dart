import '../controller/review_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ReviewScreen.
///
/// This class ensures that the ReviewController is created when the
/// ReviewScreen is first loaded.
class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewController());
  }
}
