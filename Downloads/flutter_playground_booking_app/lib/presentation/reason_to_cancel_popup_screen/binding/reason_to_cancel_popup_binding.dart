import '../controller/reason_to_cancel_popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ReasonToCancelPopupScreen.
///
/// This class ensures that the ReasonToCancelPopupController is created when the
/// ReasonToCancelPopupScreen is first loaded.
class ReasonToCancelPopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReasonToCancelPopupController());
  }
}
