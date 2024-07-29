import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'controller/password_changed_popup_controller.dart';

class PasswordChangedPopupScreen
    extends GetWidget<PasswordChangedPopupController> {
  const PasswordChangedPopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SizedBox(height: 1.v), _buildPopup()]);
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
            Text("msg_password_changed".tr,
                style: CustomTextStyles.titleLarge22),
            SizedBox(height: 19.v),
            Container(
                width: 347.h,
                margin: EdgeInsets.symmetric(horizontal: 4.h),
                child: Text("msg_your_password_has".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style:
                        theme.textTheme.bodyLarge!.copyWith(height: 1.50
                        ,color: appTheme.black900))),
            SizedBox(height: 29.v),
            CustomElevatedButton(
                text: "lbl_ok".tr,
                onPressed: () {
                 Get.offAllNamed(AppRoutes.loginScreen);
                })
          ]),
    );
  }

}
