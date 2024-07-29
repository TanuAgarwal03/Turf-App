import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../../history_upcoming_page/models/history_upcoming_model.dart';

class HistoryCompleteData{
  static List<HistoryUpcomingModel> getHistoryCompleteData(){
    return [
      HistoryUpcomingModel(ImageConstant.imgRectangle3951, "msg_since_ground_hocky".tr, "lbl_greece".tr, "lbl_15_june_monday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle3957, "msg_boys_and_girls_at".tr, "lbl_greece".tr, "lbl_20_june_friday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle3955, "msg_shot_smiley_girl2".tr, "lbl_greece".tr, "msg_25_june_wednesday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle3956, "Symbols ground ", "lbl_bangalore".tr, "msg_25_june_wednesday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle3957, "msg_since_ground_hocky".tr, "lbl_greece".tr, "lbl_15_june_monday".tr, "\$120"),
      HistoryUpcomingModel(ImageConstant.imgRectangle3958, "msg_since_ground_hocky".tr, "lbl_greece".tr, "lbl_15_june_monday".tr, "\$120"),
    ];
  }
}