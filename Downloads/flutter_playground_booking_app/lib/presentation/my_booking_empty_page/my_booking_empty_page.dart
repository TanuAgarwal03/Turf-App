import 'controller/my_booking_empty_controller.dart';
import 'models/my_booking_empty_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class MyBookingEmptyPage extends StatelessWidget {
  MyBookingEmptyPage({Key? key})
      : super(
          key: key,
        );

  MyBookingEmptyController controller =
      Get.put(MyBookingEmptyController(MyBookingEmptyModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.white,
          child: Column(
            children: [
              buildComponentOne(),
              Spacer(
                flex: 47,
              ),
              Container(
                height: 116.adaptSize,
                width: 116.adaptSize,
                padding: EdgeInsets.all(30.h),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder58,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgEdit1,
                  height: 56.adaptSize,
                  width: 56.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 20.v),
              Text(
                "lbl_no_booking_yet".tr,
                style: CustomTextStyles.titleLarge22,
              ),
              SizedBox(height: 20.v),
              Container(
                width: 346.h,
                margin: EdgeInsets.symmetric(horizontal: 40.h),
                child: Text(
                  "msg_when_you_book_an".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              Spacer(
                flex: 52,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget buildComponentOne() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Text(
            "lbl_my_booking".tr,
            style: theme.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
