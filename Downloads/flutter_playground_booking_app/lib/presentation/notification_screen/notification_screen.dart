// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import '../notification_screen/widgets/notification_item_widget.dart';
import 'controller/notification_controller.dart';
import 'models/notification_item_model.dart';




class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationController notificationController = Get.put(NotificationController());
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: ()async {
        Get.back();
        return true;
      },
      child: Scaffold(
          backgroundColor: appTheme.bgColor,
          body: SafeArea(
            child: GetBuilder<NotificationController>(
              init: NotificationController(),
              builder:(controller) =>


              controller.notificationDataList.isEmpty?Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCommonAppBar("lbl_notifications".tr),
                  Column(

                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorPrimary,
                          height: 116.adaptSize,
                          width: 116.adaptSize),
                      SizedBox(height: 20.v),
                      Text("msg_no_notifications".tr,
                          style: CustomTextStyles.titleLarge22),
                      SizedBox(height: 21.v),
                      Text("msg_we_did_not_found".tr,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: appTheme.black900,
                          )),
                    ],
                  ),
                  SizedBox()
                ],
              ):  Column(children: [
                getCommonAppBar("lbl_notifications".tr),
                SizedBox(height: 16.v),
                ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: controller.notificationDataList.length,
                  itemBuilder: (context, index) {
                    NotificationItemModel model = controller.notificationDataList[index];
                    return animationfunction(index, Padding(
                      padding:  EdgeInsets.symmetric(vertical: 8.v),
                      child: NotificationItemWidget(model),
                    ));
                  },)
              ]),
            ),
          )),
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapNotifications() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}




