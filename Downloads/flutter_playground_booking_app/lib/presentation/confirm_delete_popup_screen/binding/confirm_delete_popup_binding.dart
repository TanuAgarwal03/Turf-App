import '../controller/confirm_delete_popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ConfirmDeletePopupScreen.
///
/// This class ensures that the ConfirmDeletePopupController is created when the
/// ConfirmDeletePopupScreen is first loaded.
class ConfirmDeletePopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmDeletePopupController());
  }
}
