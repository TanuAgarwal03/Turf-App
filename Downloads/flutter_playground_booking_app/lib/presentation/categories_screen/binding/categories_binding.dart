import '../controller/categories_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CategoriesScreen.
///
/// This class ensures that the CategoriesController is created when the
/// CategoriesScreen is first loaded.
class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesController());
  }
}
