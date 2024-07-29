import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_icon_button.dart';



class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsController settingsController = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: GetBuilder<SettingsController>(
          init: SettingsController(),
          builder:(controller) =>  Container(
            width: double.maxFinite,
            child: Column(
              children: [
                getCommonAppBar( "lbl_settings".tr),
                SizedBox(height: 16.v),
                _buildProfile1((){
                  controller.pushNotification = !controller.pushNotification;
                  controller.update();
                }, ImageConstant.imgGroup9, "msg_push_notification".tr, !controller.pushNotification?ImageConstant.imgSwitchOff:ImageConstant.imgSwitchOn,),
                SizedBox(height: 16.v),
                _buildProfile1((){
                  controller.message = !controller.message;
                  controller.update();
                },ImageConstant.imgGroup1171274860, "lbl_message".tr, !controller.message?ImageConstant.imgSwitchOff:ImageConstant.imgSwitchOn),
                SizedBox(height: 16.v),
                _buildProfile1((){
                  controller.faceId = !controller.faceId;
                  controller.update();
                },ImageConstant.imgGroup1171274860Onerrorcontainer, "lbl_face_id".tr, !controller.faceId?ImageConstant.imgSwitchOff:ImageConstant.imgSwitchOn),
                SizedBox(height: 16.v),
                _buildProfile1((){

                  ThemeHelper().changeTheme();
                  setSafeAreaColor();
                },ImageConstant.imgThemeIcon, "Theme mode",  PrefUtils().getThemeData() == "primary"?ImageConstant.imgSwitchOff:ImageConstant.imgSwitchOn,),

              ],
            ),
          ),
        ),
      ),
    );
  }





  /// Section Widget
  Widget _buildProfile1(function,prefixicon,title,suffixIcon) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: Container(
        padding: EdgeInsets.all(8.h),
        decoration: AppDecoration.fillGray.copyWith(
          color: appTheme.textfieldFillColor,
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          children: [
            CustomIconButton(
              height: 48.adaptSize,
              width: 48.adaptSize,
              padding: EdgeInsets.all(12.h),
              decoration: IconButtonStyleHelper.fillPrimaryContainerTL24,
              child: CustomImageView(
                color: appTheme.black900,
                imagePath: prefixicon,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 15.v,
                bottom: 12.v,
              ),
              child: Text(
                title,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: appTheme.black900,
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: function,
              child: CustomImageView(

                imagePath: suffixIcon,
              ),
            )
          ],
        ),
      ),
    );
  }


}






