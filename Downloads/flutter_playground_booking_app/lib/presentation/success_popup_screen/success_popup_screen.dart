import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'controller/success_popup_controller.dart';

class SuccessPopupScreen extends GetWidget<SuccessPopupController> {
  const SuccessPopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return  _buildPopup();
  }

  /// Section Widget
  Widget _buildPopup() {
    return Padding(
     padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 32.v),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           SizedBox(height: 6.v),
           Container(
               height: 101.adaptSize,
               width: 101.adaptSize,
               padding:
               EdgeInsets.symmetric(horizontal: 24.h, vertical: 31.v),
               decoration: AppDecoration.fillPrimary
                   .copyWith(borderRadius: BorderRadiusStyle.circleBorder50),
               child: CustomImageView(
                   imagePath: ImageConstant.imgVector,
                   height: 38.v,
                   width: 53.h,
                   alignment: Alignment.center)),
           SizedBox(height: 28.v),
           Text("msg_your_request_has".tr,
               style: CustomTextStyles.titleLarge22),
           SizedBox(height: 33.v),
           CustomElevatedButton(
               text: "lbl_ok".tr,
               onPressed: () {
                onTapOk();
               })
          ]),
    );
  }

  /// Navigates to the addGroundScreen when the action is triggered.
  onTapOk() {
   Get.back();
   Get.back();
   Get.back();
   Get.back();}
}
