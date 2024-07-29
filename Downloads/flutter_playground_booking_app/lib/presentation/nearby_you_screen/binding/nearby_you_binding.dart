import '../controller/nearby_you_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NearbyYouScreen.
///
/// This class ensures that the NearbyYouController is created when the
/// NearbyYouScreen is first loaded.
class NearbyYouBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NearbyYouController());
  }
}
