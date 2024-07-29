import 'package:flutter_playground_booking_app/core/app_export.dart';

import 'history_upcoming_model.dart';

class HistoryUpcomingData{
  static List<HistoryUpcomingModel> getHistryUpcomingData(){
    return [
      HistoryUpcomingModel(ImageConstant.imgRectangle395, "msg_since_ground_hocky".tr, "lbl_greece".tr, "lbl_15_june_monday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle40185, "msg_boys_and_girls_at".tr, "lbl_greece".tr, "lbl_20_june_friday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle39590x90, "msg_shot_smiley_girl2".tr, "lbl_greece".tr, "msg_25_june_wednesday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle3951, "Symbols ground ", "lbl_bangalore".tr, "msg_25_june_wednesday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle3952, "msg_since_ground_hocky".tr, "lbl_greece".tr, "lbl_15_june_monday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle395, "msg_since_ground_hocky".tr, "lbl_greece".tr, "lbl_15_june_monday".tr, "\$120"),
    ];
  }
}