// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'controller/order_placed_controller.dart';

class OrderPlacedScreen extends GetWidget<OrderPlacedController> {
  const OrderPlacedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
     onWillPop: () async{
      Get.offAllNamed(AppRoutes.homeContainerScreen);
       return true;
     },
      child: Scaffold(
       backgroundColor: appTheme.bgColor,
          body: SafeArea(
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(20.h),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_order_placed".tr,
                          style: theme.textTheme.headlineMedium!.copyWith(
                           color:appTheme.black900
                          ))),
                  Spacer(flex: 51),
                  Container(
                      height: 101.adaptSize,
                      width: 101.adaptSize,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.h, vertical: 31.v),
                      decoration: AppDecoration.fillPrimary.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder50),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgVector,
                          height: 38.v,
                          width: 53.h,
                          alignment: Alignment.center)),
                  SizedBox(height: 28.v),
                  Text("msg_booking_successfull".tr,
                      style: CustomTextStyles.titleLarge22),
                  SizedBox(height: 11.v),
                  Container(
                      width: 345.h,
                      margin: EdgeInsets.only(left: 23.h, right: 19.h),
                      child: Text("msg_congratulations".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(height: 1.50,
                          color: appTheme.black900))),
                  Spacer(flex: 48)
                ])),
          ),
          bottomNavigationBar: buildBackToHome()),
    );
  }

  /// Section Widget
  Widget buildBackToHome() {
    return CustomElevatedButton(
        text: "lbl_back_to_home".tr,
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 32.v),
        onPressed: () {
         Get.offAllNamed(AppRoutes.homeContainerScreen);
        });
  }

  /// Navigates to the paymentScreen when the action is triggered.
  onTapBackToHome() {
    Get.toNamed(
      AppRoutes.paymentScreen,
    );
  }
}
