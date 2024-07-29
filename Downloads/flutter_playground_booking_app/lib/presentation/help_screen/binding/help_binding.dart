import '../controller/help_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HelpScreen.
///
/// This class ensures that the HelpController is created when the
/// HelpScreen is first loaded.
class HelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpController());
  }
}
