import '../controller/foot_ball_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FootBallScreen.
///
/// This class ensures that the FootBallController is created when the
/// FootBallScreen is first loaded.
class FootBallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FootBallController());
  }
}
