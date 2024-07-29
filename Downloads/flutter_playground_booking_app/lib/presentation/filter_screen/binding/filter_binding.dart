import '../controller/filter_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FilterScreen.
///
/// This class ensures that the FilterController is created when the
/// FilterScreen is first loaded.
class FilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterController());
  }
}
