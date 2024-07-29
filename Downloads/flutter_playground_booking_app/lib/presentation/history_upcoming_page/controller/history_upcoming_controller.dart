
/// A controller class for the HistoryUpcomingPage.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/history_upcoming_page/models/history_upcoming_model.dart';

import '../models/history_upcoming_data.dart';

///
/// This class manages the state of the HistoryUpcomingPage, including the
/// current historyUpcomingModelObj
class HistoryUpcomingController extends GetxController {


  List<HistoryUpcomingModel> historyUpcomingDataList = HistoryUpcomingData.getHistryUpcomingData();



}
