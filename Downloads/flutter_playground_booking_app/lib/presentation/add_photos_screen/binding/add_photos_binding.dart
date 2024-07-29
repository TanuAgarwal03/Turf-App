import '../controller/add_photos_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddPhotosScreen.
///
/// This class ensures that the AddPhotosController is created when the
/// AddPhotosScreen is first loaded.
class AddPhotosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPhotosController());
  }
}
