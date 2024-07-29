import '../controller/popular_ground_controller.dart';
import '../models/popularground_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class PopulargroundItemWidget extends StatelessWidget {
  PopulargroundItemWidget(
    this.populargroundItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  PopulargroundItemModel populargroundItemModelObj;

  var controller = Get.find<PopularGroundController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularGroundController>(
      init: PopularGroundController(),
      builder:(controller) =>  GestureDetector(
        onTap: (){
          controller.currentimage = populargroundItemModelObj.image!;
          controller.update();
          Get.toNamed(AppRoutes.detailScreen);
        },
        child: Container(
          width: double.infinity,
          decoration: AppDecoration.fillGray.copyWith(
            color: appTheme.textfieldFillColor,
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: populargroundItemModelObj.image!,
                child: CustomImageView(
                  imagePath: populargroundItemModelObj.image,
                  height: 181.v,
                  width: double.infinity,
                  radius: BorderRadius.circular(
                    16.h,
                  ),
                  alignment: Alignment.topCenter,
                ),
              ),
              SizedBox(height: 16.v),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        populargroundItemModelObj.title!,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.black900,
                        ),
                      ),
                      SizedBox(height: 4.5.v),
                      Row(
                        children: [
                          CustomImageView(
                            color: appTheme.black900,
                            imagePath: ImageConstant.imgIcLocation,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              populargroundItemModelObj.location!,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: appTheme.black900,
                              )
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: populargroundItemModelObj.isBedMintan!?ImageConstant.imgShuttlecock31:ImageConstant.imgShuttlecock1,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                      SizedBox(width: 8.h),
                      CustomImageView(
                        imagePath: populargroundItemModelObj.iscricket!?ImageConstant.imgBall1LightGreen400:ImageConstant.imgTennisBall1,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                      SizedBox(width: 8.h),
                      CustomImageView(
                        imagePath:populargroundItemModelObj.isfootball!?ImageConstant.imgBasketBall:ImageConstant.imgBasketBall,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ],
                  )

                ],
              ),
            ),
              SizedBox(height: 16.v),
            ],
          ),
        ),
      ),
    );
  }
}
