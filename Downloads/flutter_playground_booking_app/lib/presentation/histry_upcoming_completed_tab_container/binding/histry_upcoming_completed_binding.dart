import 'package:get/get.dart';
import '../histry_upcoming_completed_tab_container.dart';

class HistryUpcomingCompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistryUpcomingCompletedTab());
  }
}
