import '../controller/order_placed_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrderPlacedScreen.
///
/// This class ensures that the OrderPlacedController is created when the
/// OrderPlacedScreen is first loaded.
class OrderPlacedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderPlacedController());
  }
}
