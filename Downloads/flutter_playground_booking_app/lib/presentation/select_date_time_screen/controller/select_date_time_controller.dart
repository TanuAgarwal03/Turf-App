import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/select_date_time_screen/models/select_date_time_model.dart';
import '../models/selet_time_data.dart';

class SelectDateTimeController extends GetxController {
 List<SelectDateTimeModel> timeData = SelectTimeData.getTimeData();
 int currentTime = 0;
}
