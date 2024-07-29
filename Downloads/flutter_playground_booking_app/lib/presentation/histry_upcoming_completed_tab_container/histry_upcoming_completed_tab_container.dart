import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/history_complate_page/history_complate_page.dart';
import 'package:flutter_playground_booking_app/presentation/history_upcoming_page/history_upcoming_page.dart';
import '../history_upcoming_page/controller/history_upcoming_controller.dart';
import 'controller/histry_upcoming_completed_tab_container_controller.dart';

class HistryUpcomingCompletedTab extends StatefulWidget {
  const HistryUpcomingCompletedTab({super.key});

  @override
  State<HistryUpcomingCompletedTab> createState() => _HistryUpcomingCompletedTabState();
}

class _HistryUpcomingCompletedTabState extends State<HistryUpcomingCompletedTab> {
  HistrotyUpcomingCompletedTabContainerController controller = Get.put(
      HistrotyUpcomingCompletedTabContainerController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return GetBuilder<HistoryUpcomingController>(
        init: HistoryUpcomingController(),
        builder: (historyUpcomingController) =>
        historyUpcomingController.historyUpcomingDataList.isEmpty
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
                  "History",
                  style: theme.textTheme.headlineMedium!.copyWith(
                      color: appTheme.black900
                  )
              ),
            ),
            SizedBox(height: 40.v),
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
                    HistoryUpcomingPage(),
                    HistoryComplatePage(),
                  ],
                ),
              ),
            ),

          ],
        ));
  }
}
