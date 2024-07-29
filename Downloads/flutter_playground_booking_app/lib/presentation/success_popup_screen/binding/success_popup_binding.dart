import '../controller/success_popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SuccessPopupScreen.
///
/// This class ensures that the SuccessPopupController is created when the
/// SuccessPopupScreen is first loaded.
class SuccessPopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessPopupController());
  }
}
