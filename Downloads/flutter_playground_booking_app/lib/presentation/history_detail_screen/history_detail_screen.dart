import 'controller/history_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class HistoryDetailScreen extends GetWidget<HistoryDetailController> {
  const HistoryDetailScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildComponentOne(),
              SizedBox(height: 16.v),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle395,
                height: 180.v,
                width: 388.h,
                radius: BorderRadius.circular(
                  16.h,
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "msg_since_ground_hocky".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgIcLocation,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: Text(
                        "lbl_greece".tr,
                        style: CustomTextStyles.bodyMediumOnErrorContainer,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "lbl_facilities".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 19.v),
              _buildFacility(),
              SizedBox(height: 24.v),
              _buildDetails(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildComponentOne() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          CustomElevatedButton(
            height: 34.v,
            width: 210.h,
            text: "lbl_history_detail".tr,
            leftIcon: Container(
              margin: EdgeInsets.only(right: 16.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgIcDown,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
            buttonStyle: CustomButtonStyles.none,
            buttonTextStyle: theme.textTheme.headlineMedium!,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFacility() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 8.v,
              ),
              decoration: AppDecoration.fillGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: EdgeInsets.all(0),
                    color: theme.colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.circleBorder20,
                    ),
                    child: Container(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      padding: EdgeInsets.all(10.h),
                      decoration: AppDecoration.white.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder20,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgInProgressSquare,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            alignment: Alignment.center,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "lbl_p".tr,
                              style: CustomTextStyles.bodyMediumLightgreen800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    "lbl_parking".tr,
                    style: CustomTextStyles.bodyMediumOnErrorContainer,
                  ),
                  SizedBox(height: 1.v),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: _buildIcRoom(
                icRoom: ImageConstant.imgIcCamera,
                waitingRo: "lbl_camera".tr,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: _buildIcRoom(
                icRoom: ImageConstant.imgIcRoom,
                waitingRo: "lbl_waiting_ro".tr,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: _buildIcRoom(
                icRoom: ImageConstant.imgIcChangingRoom,
                waitingRo: "lbl_change_ro".tr,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDetails() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 17.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "lbl_ground".tr,
                    style: CustomTextStyles.bodyLargeGray60001,
                  ),
                  Text(
                    "lbl_ground_01".tr,
                    style: CustomTextStyles.titleMedium16,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            _buildDate(
              date: "lbl_booking_code".tr,
              friSep: "lbl_gr0175".tr,
            ),
            SizedBox(height: 18.v),
            _buildDate(
              date: "lbl_date".tr,
              friSep: "lbl_fri_04_sep".tr,
            ),
            SizedBox(height: 18.v),
            _buildDate(
              date: "lbl_time".tr,
              friSep: "lbl_11_00_pm".tr,
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildIcRoom({
    required String icRoom,
    required String waitingRo,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40.adaptSize,
            width: 40.adaptSize,
            padding: EdgeInsets.all(8.h),
            decoration: AppDecoration.white.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder20,
            ),
            child: CustomImageView(
              imagePath: icRoom,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: 10.v),
          Text(
            waitingRo,
            style: CustomTextStyles.bodyMediumOnErrorContainer.copyWith(
              color: theme.colorScheme.onErrorContainer,
            ),
          ),
          SizedBox(height: 1.v),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildDate({
    required String date,
    required String friSep,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Text(
            date,
            style: CustomTextStyles.bodyLargeGray60001.copyWith(
              color: appTheme.gray60001,
            ),
          ),
        ),
        Text(
          friSep,
          style: CustomTextStyles.titleMedium16.copyWith(
            color: theme.colorScheme.onErrorContainer,
          ),
        ),
      ],
    );
  }
}
