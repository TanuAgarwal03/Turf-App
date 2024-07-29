import '../controller/my_grounds_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyGroundsScreen.
///
/// This class ensures that the MyGroundsController is created when the
/// MyGroundsScreen is first loaded.
class MyGroundsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyGroundsController());
  }
}
