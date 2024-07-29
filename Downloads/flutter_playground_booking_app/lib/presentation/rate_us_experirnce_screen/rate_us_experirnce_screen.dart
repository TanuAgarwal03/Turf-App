import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'controller/rate_us_experirnce_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class RateUsExperirnceScreen extends GetWidget<RateUsExperirnceController> {
  const RateUsExperirnceScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 32.v,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
          buildRateUsExperirnce(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildRateUsExperirnce() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 4.v),
        Text(
          "msg_rate_us_experirnce".tr,
          style: CustomTextStyles.titleLarge22,
        ),
        SizedBox(height: 20.v),
        Container(
          width: 278.h,
          margin: EdgeInsets.symmetric(horizontal: 38.h),
          child: Text(
            "msg_please_let_us_know".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: appTheme.black900,
              height: 1.50,
            ),
          ),
        ),
        SizedBox(height: 29.v),

        RatingBar(
          initialRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 48.adaptSize,
          glow: false,
          ratingWidget: RatingWidget(
              full: CustomImageView(
                imagePath: ImageConstant.imgIcStarAmber500,
                height: 48.adaptSize,
                width: 48.adaptSize,
              ),
              half: CustomImageView(
                color: appTheme.ratingIconColor,
                imagePath: ImageConstant.imgIcStarGray300,
                height: 48.adaptSize,
                width: 48.adaptSize,
              ),
              empty: CustomImageView(
                color: appTheme.ratingIconColor,
                imagePath:ImageConstant.imgIcStarGray300,
                height: 48.adaptSize,
                width: 48.adaptSize,
              )),
          itemPadding: EdgeInsets.only(left: 8.h, right: 8.h),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(height: 40.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomOutlinedButton(
              onPressed: () {
                Get.back();
              },
              width: 170.h,
              text: "lbl_cancel".tr,
              margin: EdgeInsets.only(right: 8.h),
            ),
            CustomElevatedButton(
              width: 170.h,
              text: "lbl_submit".tr,
              margin: EdgeInsets.only(left: 8.h),
            ),
          ],
        ),
      ],
    );
  }
}
