import 'package:flutter_playground_booking_app/presentation/select_date_time_screen/models/select_date_time_model.dart';

class SelectTimeData{
  static List<SelectDateTimeModel> getTimeData(){
    return [
      SelectDateTimeModel("10:00 PM to 12:00 PM"),
      SelectDateTimeModel("12:00 PM to 02:00 PM"),
      SelectDateTimeModel("02:00 PM to 04:00 PM"),
      SelectDateTimeModel("04:00 PM to 06:00 PM"),
      SelectDateTimeModel("06:00 PM to 08:00 PM"),
      SelectDateTimeModel("08:00 PM to 10:00 PM"),

    ];
  }
}