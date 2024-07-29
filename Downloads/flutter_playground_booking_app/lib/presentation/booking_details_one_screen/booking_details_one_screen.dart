// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import '../detail_screen/controller/detail_controller.dart';
import '../detail_screen/models/detailscreen_item_model.dart';
import 'controller/booking_details_one_controller.dart';



class BookingDetailsOneScreen extends StatefulWidget {
  const BookingDetailsOneScreen({super.key});

  @override
  State<BookingDetailsOneScreen> createState() => _BookingDetailsOneScreenState();
}

class _BookingDetailsOneScreenState extends State<BookingDetailsOneScreen> {
  BookingDetailsOneController controller = Get.put(BookingDetailsOneController());
  DetailController detailController = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: ()async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox(
                width: double.maxFinite,
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  getCommonAppBar("lbl_booking_details".tr),
                  SizedBox(height: 16.v),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgRectangle40185,
                        height: 180.v,
                        width:double.infinity,
                        fit: BoxFit.fill,
                        radius: BorderRadius.circular(16.h)),
                  ),
                  SizedBox(height: 20.v),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
                    child: Text("msg_boys_and_girls_running".tr,
                        style: theme.textTheme.titleLarge!.copyWith(color: appTheme.black900)),
                  ),
                  SizedBox(height: 5.v),
                  Padding(
                      padding: EdgeInsets.only(left: 20.h,right: 20.h),
                      child: Row(
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
                               "msg_agrasen_institute".tr,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: appTheme.black900,
                                )
                            ),
                          ),
                        ],
                      ),
                     ),


                  SizedBox(height: 27.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text("lbl_facilities".tr,
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: appTheme.black900,
                              )))),
                  SizedBox(height: 19.v),
                      GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: detailController.facilityList.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 85.v,
                            crossAxisCount: 4,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 16.h),
                        itemBuilder: (context, index) {
                          DetailscreenItemModel model =
                          detailController.facilityList[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(12.h),
                              color: appTheme.textfieldFillColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.h),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40.v,
                                    width: 40.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: appTheme.whiteA700
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(10.h),
                                      child: CustomImageView(
                                        imagePath: model.icon,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.v,
                                  ),
                                  Text(model.title!,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .bodyMediumOnErrorContainer
                                          .copyWith(
                                          color: appTheme.black900)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  SizedBox(height: 24.v),
                  buildDetails(),
                  SizedBox(height: 5.v)
                ])),
          ),
          bottomNavigationBar: buildButtons()),
    );
  }



  /// Section Widget
  Widget buildDetails() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16,
        color: appTheme.textfieldFillColor),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.only(right: 3.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("lbl_ground".tr,
                        style: CustomTextStyles.bodyLargeGray60001),
                    Text("lbl_ground_01".tr,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.black900,
                          fontSize: 16.fSize,
                        ))
                  ])),
          SizedBox(height: 20.v),
          _buildDate(date: "lbl_booking_code".tr, friSep: "lbl_gr0175".tr),
          SizedBox(height: 18.v),
          _buildDate(date: "lbl_date".tr, friSep: "lbl_fri_04_sep".tr),
          SizedBox(height: 18.v),
          _buildDate(date: "lbl_time".tr, friSep: "lbl_11_00_pm".tr)
        ]));
  }

  /// Section Widget
  Widget buildButtons() {
    return Container(
        width: double.infinity,

        decoration: AppDecoration.white.copyWith(
          color: appTheme.bgColor,
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 20.h,right:20.h,top:16.v,bottom: 32.v),
          child: CustomElevatedButton(
              text: "msg_procced_to_payment".tr,
              onPressed: () {
                onTapProccedToPayment();
              }),
        ));
  }

  /// Common widget
  Widget _buildDate({
    required String date,
    required String friSep,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Text(date,
              style: CustomTextStyles.bodyLargeGray60001
                  .copyWith(color: appTheme.gray60001))),
      Text(friSep,
          style: CustomTextStyles.titleMedium16
              .copyWith(color: appTheme.black900))
    ]);
  }

  /// Navigates to the selectDateTimeScreen when the action is triggered.
  onTapBookingDetails() {
    Get.toNamed(
      AppRoutes.selectDateTimeScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  onTapProccedToPayment() {
    Get.toNamed(
      AppRoutes.paymentScreen,
    );
  }
}

