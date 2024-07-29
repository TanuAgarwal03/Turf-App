import '../controller/detail_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DetailScreen.
///
/// This class ensures that the DetailController is created when the
/// DetailScreen is first loaded.
class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
