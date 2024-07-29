import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../../history_upcoming_page/models/history_upcoming_model.dart';
import '../models/history_complete_data.dart';

/// A controller class for the HistoryComplatePage.
///
/// This class manages the state of the HistoryComplatePage, including the
/// current historyComplateModelObj
class HistoryComplateController extends GetxController {
 List<HistoryUpcomingModel>  completedDataList= HistoryCompleteData.getHistoryCompleteData();
}
