import 'package:flutter_playground_booking_app/core/app_export.dart';

import 'ground_category_model.dart';

class GroundCategoryData{
  static List<GroundCategoryModel> getGroundCategoryData(){
    return [
      GroundCategoryModel(ImageConstant.imgTennisBall1Onerrorcontainer,"lbl_tenis_ground".tr,1),
      GroundCategoryModel(ImageConstant.imgShuttlecock1Onerrorcontainer,"lbl_badminton".tr,2),
      GroundCategoryModel(ImageConstant.imgBasketBall1Onerrorcontainer,"lbl_basket_ground".tr,3),
      GroundCategoryModel(ImageConstant.imgSoccer1,"lbl_football3".tr,4),
      GroundCategoryModel(ImageConstant.imgBeachball1,"lbl_vollyball2".tr,5),
    ];
  }
}