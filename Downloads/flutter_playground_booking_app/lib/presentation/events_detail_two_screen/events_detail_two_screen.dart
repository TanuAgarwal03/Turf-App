// ignore_for_file: deprecated_member_use

import '../detail_screen/models/ground_list_model.dart';
import '../events_detail_two_screen/widgets/eventsdetailtwo_item_widget.dart';
import 'controller/events_detail_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';




class EventsDetailTwoScreen extends StatefulWidget {
  const EventsDetailTwoScreen({super.key});

  @override
  State<EventsDetailTwoScreen> createState() => _EventsDetailTwoScreenState();
}

class _EventsDetailTwoScreenState extends State<EventsDetailTwoScreen> {
  EventsDetailTwoController controller = Get.put(EventsDetailTwoController());
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
          child: Column(
            children: [
              getCommonAppBar("lbl_booking_details".tr),
              SizedBox(height: 16.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgIamge,
                  height: 180.v,
                  width: double.infinity,
                  radius: BorderRadius.circular(
                    16.h,
                  ),
                ),
              ),
              SizedBox(height: 18.v),
              _buildTitle(),
              SizedBox(height: 27.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text(
                    "lbl_facilities".tr,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: appTheme.black900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 19.v),
              _buildFacility(),
              SizedBox(height: 26.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text(
                    "lbl_ground_list".tr,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: appTheme.black900
                    ),
                  ),
                ),
              ),
              SizedBox(height: 19.v),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                primary: false,
                shrinkWrap: true,
                itemCount: controller.groundList.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 173.v,
                    crossAxisCount: 3,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 17.h),
                itemBuilder: (context, index) {
                  GroundListModel model =
                  controller.groundList[index];
                  return EventsdetailtwoItemWidget(model);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildButtons(),
      ),
    );
  }


  /// Section Widget
  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_main_ground".tr,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
                SizedBox(height: 5.v),
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
                      child: Text("msg_agrasen_institute".tr,
                          style:
                          theme.textTheme.bodyMedium!.copyWith(
                            color: appTheme.black900,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 16.v),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 27.v),
            child: Text(
              "lbl_100_00".tr,
              style: CustomTextStyles.titleLargePrimary,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFacility() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcTickets(
            icTickets: ImageConstant.imgIcGroup,
            matchCounter: "lbl_31_team".tr,
          ),
          Padding(
            padding: EdgeInsets.only(left: 17.h),
            child: _buildIcTickets(
              icTickets: ImageConstant.imgIcTickets,
              matchCounter: "lbl_50_match".tr,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 17.h),
            child: _buildIcTickets(
              icTickets: ImageConstant.imgIcLocationDeepOrange300,
              matchCounter: "lbl_banglore".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildButtons() {
    return Container(
    width: double.infinity,
   color: appTheme.bgColor,
      child: Padding(
        padding:  EdgeInsets.only(left: 20.h,right: 20.h,bottom:32.v,top: 16.v),
        child: CustomElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.paymentScreen);
          },
          text: "msg_procced_to_payment".tr,
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildIcTickets({
    required String icTickets,
    required String matchCounter,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        color: appTheme.textfieldFillColor,
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
              imagePath: icTickets,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: 9.v),
          Text(
            matchCounter,
            style: CustomTextStyles.bodyMediumOnErrorContainer.copyWith(
              color: appTheme.black900,
            ),
          ),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }
}




