import '../controller/history_complate_detail_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HistoryComplateDetailScreen.
///
/// This class ensures that the HistoryComplateDetailController is created when the
/// HistoryComplateDetailScreen is first loaded.
class HistoryComplateDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryComplateDetailController());
  }
}
