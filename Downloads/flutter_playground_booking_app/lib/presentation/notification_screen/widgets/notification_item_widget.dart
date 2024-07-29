import '../controller/notification_controller.dart';
import '../models/notification_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class NotificationItemWidget extends StatelessWidget {
  NotificationItemWidget(
    this.notificationItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationItemModel notificationItemModelObj;

  var controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.fillGray.copyWith(
        color: appTheme.textfieldFillColor,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appTheme.lightgraynightMode,
            ),
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: CustomImageView(
                color: appTheme.black900,
                height: 24.adaptSize,
                width: 24.adaptSize,
                imagePath:  ImageConstant.imgGroup9,
              ),
            ),
          ),
          // CustomIconButton(
          //   height: 48.adaptSize,
          //   width: 48.adaptSize,
          //   padding: EdgeInsets.all(12.h),
          //   child: CustomImageView(
          //     imagePath: ImageConstant.imgGroup9,
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 3.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationItemModelObj
                        .messege!,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: appTheme.black900,
                    )
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    notificationItemModelObj.time!,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
