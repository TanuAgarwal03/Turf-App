import '../controller/ground_category_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GroundCategoryScreen.
///
/// This class ensures that the GroundCategoryController is created when the
/// GroundCategoryScreen is first loaded.
class GroundCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroundCategoryController());
  }
}
