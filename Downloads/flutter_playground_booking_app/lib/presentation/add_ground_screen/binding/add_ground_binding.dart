import '../controller/add_ground_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddGroundScreen.
///
/// This class ensures that the AddGroundController is created when the
/// AddGroundScreen is first loaded.
class AddGroundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddGroundController());
  }
}
