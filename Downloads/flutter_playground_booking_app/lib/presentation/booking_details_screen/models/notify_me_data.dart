import 'package:flutter_playground_booking_app/core/app_export.dart';

import 'booking_details_model.dart';

class NotifyMeData{
  static List<BookingDetailsModel> getNotifyData(){
    return [
      BookingDetailsModel(ImageConstant.imgEllipse921, "lbl_theresa_webb".tr),
      BookingDetailsModel(ImageConstant.imgEllipse92148x48, "lbl_esther_howard".tr,),
      BookingDetailsModel(ImageConstant.imgEllipse9211, "lbl_annette_black".tr),
      BookingDetailsModel(ImageConstant.imgEllipse9212, "lbl_darrell_steward".tr),
    ];
  }
}