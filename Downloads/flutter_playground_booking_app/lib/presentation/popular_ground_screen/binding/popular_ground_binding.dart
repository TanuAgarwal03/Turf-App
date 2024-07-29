import '../controller/popular_ground_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PopularGroundScreen.
///
/// This class ensures that the PopularGroundController is created when the
/// PopularGroundScreen is first loaded.
class PopularGroundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopularGroundController());
  }
}
