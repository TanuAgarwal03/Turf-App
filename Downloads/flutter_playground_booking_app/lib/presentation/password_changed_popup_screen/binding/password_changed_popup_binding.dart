import '../controller/password_changed_popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PasswordChangedPopupScreen.
///
/// This class ensures that the PasswordChangedPopupController is created when the
/// PasswordChangedPopupScreen is first loaded.
class PasswordChangedPopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordChangedPopupController());
  }
}
