import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_outlined_button.dart';
import 'controller/confirm_delete_popup_controller.dart';

class ConfirmDeletePopupScreen extends GetWidget<ConfirmDeletePopupController> {
  const ConfirmDeletePopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: double.maxFinite,
        child: _buildCancel());
  }

  /// Section Widget
  Widget _buildCancel() {
    return Padding(
     padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 32.v),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
       Container(
           height: 116.adaptSize,
           width: 116.adaptSize,
           padding: EdgeInsets.symmetric(horizontal: 33.h, vertical: 27.v),
           decoration: AppDecoration.fillPrimary
               .copyWith(borderRadius: BorderRadiusStyle.circleBorder58),
           child: CustomImageView(
               imagePath: ImageConstant.imgVectorPrimarycontainer,
               height: 61.v,
               width: 48.h,
               alignment: Alignment.center)),
       SizedBox(height: 19.v),
       Container(
           width: 313.h,
           margin: EdgeInsets.symmetric(horizontal: 21.h),
           child: Text("msg_are_you_sure_you".tr,
               maxLines: 2,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.center,
               style: CustomTextStyles.titleLarge22.copyWith(
                   color: appTheme.black900,
                   height: 1.50))),
       SizedBox(height: 15.v),
       Text("msg_you_will_not_be".tr, style: theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
          height: 1.50
       )),
       SizedBox(height: 33.v),
       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: CustomOutlinedButton(
                text: "lbl_cancel".tr,
                margin: EdgeInsets.only(right: 8.h),
                onPressed: () {
                 onTapCancel();
                })),
        Expanded(
            child: CustomElevatedButton(
                text: "lbl_delete".tr,
                margin: EdgeInsets.only(left: 8.h),
                onPressed: () {
                 onTapDelete();
                }))
       ])
      ]),
    );
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapCancel() {
   Get.back();
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapDelete() {
   Get.offAllNamed(AppRoutes.homeContainerScreen);
  }
}
