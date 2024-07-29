import '../my_booking_upcoming_page/controller/my_booking_upcoming_controller.dart';
import '../my_booking_upcoming_page/my_booking_upcoming_page.dart';
import 'controller/my_booking_upcoming_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/my_booking_complated_page/my_booking_complated_page.dart';


class MyBookingUpcomingTabContainerScreen extends StatefulWidget {
  const MyBookingUpcomingTabContainerScreen({super.key});

  @override
  State<MyBookingUpcomingTabContainerScreen> createState() =>
      _MyBookingUpcomingTabContainerScreenState();
}

class _MyBookingUpcomingTabContainerScreenState
    extends State<MyBookingUpcomingTabContainerScreen> {
  MyBookingUpcomingTabContainerController controller = Get.put(
      MyBookingUpcomingTabContainerController());
  MyBookingUpcomingController myBookingUpcomingController = Get.put(
      MyBookingUpcomingController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return GetBuilder<MyBookingUpcomingController>(
        init: MyBookingUpcomingController(),
        builder: (myBookingUpcomingController) =>
        myBookingUpcomingController.getMybookingUpcoming.isEmpty
            ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h,top: 16.v),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "lbl_my_booking".tr,
                    style: theme.textTheme.headlineMedium!.copyWith(
                        color: appTheme.black900
                    )
                ),
              ),
            ),
            Column(
              children: [
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
                      color: appTheme.black900,
                      height: 1.50,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox()
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h),
              child: Text(
                  "lbl_my_booking".tr,
                  style: theme.textTheme.headlineMedium!.copyWith(
                      color: appTheme.black900
                  )
              ),
            ),
            SizedBox(height: 43.v),
            Container(
              height: 32.v,
              width: double.infinity,
              child: TabBar(
                controller: controller.tabviewController,
                labelPadding: EdgeInsets.zero,
                labelColor: theme.colorScheme.primary,
                labelStyle: TextStyle(
                  fontSize: 16.fSize,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                unselectedLabelColor: appTheme.gray60001,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.fSize,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                ),
                indicatorColor: theme.colorScheme.primary,
                tabs: [
                  Tab(
                    child: Text(
                      "lbl_upcoming".tr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "lbl_complated".tr,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.v),
            Expanded(
              child: SizedBox(
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    MyBookingUpcomingPage(),
                    MyBookingComplatedPage(),
                  ],
                ),
              ),
            ),

          ],
        ));
  }
}

