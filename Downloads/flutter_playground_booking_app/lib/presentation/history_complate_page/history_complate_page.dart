import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../history_upcoming_page/models/history_upcoming_model.dart';
import 'controller/history_complate_controller.dart';

// ignore_for_file: must_be_immutable
class HistoryComplatePage extends StatefulWidget {
  HistoryComplatePage({Key? key}) : super(key: key);

  @override
  State<HistoryComplatePage> createState() => _HistoryComplatePageState();
}

class _HistoryComplatePageState extends State<HistoryComplatePage> {
  HistoryComplateController controller = Get.put(HistoryComplateController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return ListView.builder(
      padding: EdgeInsets.only(top: 4,left: 20.h,right: 20.h),
      primary: false,
      shrinkWrap: true,
      itemCount: controller.completedDataList.length,

      itemBuilder: (context, index) {
        HistoryUpcomingModel data =
        controller.completedDataList[index];
        return animationfunction(index, Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.v),
          child: GestureDetector(
              onTap: () {
                onTapPreviousHistory();
              },
              child: Container(
                  padding: EdgeInsets.all(4.h),
                  decoration: AppDecoration.fillGray
                      .copyWith(
                      color: appTheme.textfieldFillColor,
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: data.image,
                        height: 90.adaptSize,
                        width: 90.adaptSize,
                        radius: BorderRadius.circular(16.h)),
                    Padding(
                        padding: EdgeInsets.only(left: 16.h, top: 8.v, bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title!,
                                  style: theme.textTheme.titleMedium!.copyWith(
                                      color: appTheme.black900
                                  )),
                              SizedBox(height: 5.v),
                              _buildFrame1(greece:data.location!),
                              SizedBox(height: 9.v),
                              Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgIcBooking,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize),
                                Padding(
                                    padding: EdgeInsets.only(left: 7.h, top: 2.v),
                                    child: Text(data.date!,
                                        style: theme.textTheme.bodyMedium))
                              ])
                            ])),
                    Spacer(),
                    Padding(
                        padding:
                        EdgeInsets.only(top: 33.v, right: 12.h, bottom: 34.v),
                        child:
                        Text(data.price!, style: theme.textTheme.titleMedium!.copyWith(
                            color: appTheme.black900
                        )))
                  ]))),
        ));
      },);

  }
  Widget _buildFrame1({required String greece}) {
    return Row(children: [
      CustomImageView(
          imagePath: ImageConstant.imgIcLocationGray60001,
          height: 20.adaptSize,
          width: 20.adaptSize),
      Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Text(greece,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: appTheme.gray60001)))
    ]);
  }





  /// Navigates to the historyDetailScreen when the action is triggered.
  onTapPreviousHistory() {
    Get.toNamed(
      AppRoutes.historyComplateDetailScreen,
    );
  }
}
