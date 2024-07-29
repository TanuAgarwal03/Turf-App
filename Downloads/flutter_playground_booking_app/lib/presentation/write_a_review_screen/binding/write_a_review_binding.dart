import '../controller/write_a_review_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WriteAReviewScreen.
///
/// This class ensures that the WriteAReviewController is created when the
/// WriteAReviewScreen is first loaded.
class WriteAReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WriteAReviewController());
  }
}
