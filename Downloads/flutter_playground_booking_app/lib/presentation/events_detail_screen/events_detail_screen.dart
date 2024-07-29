// ignore_for_file: deprecated_member_use

import 'package:expandable_text/expandable_text.dart';
import '../events_detail_screen/widgets/eventsdetail_item_widget.dart';
import 'controller/events_detail_controller.dart';
import 'models/eventsdetail_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';




class EventsDetailScreen extends StatefulWidget {
  const EventsDetailScreen({super.key});

  @override
  State<EventsDetailScreen> createState() => _EventsDetailScreenState();
}

class _EventsDetailScreenState extends State<EventsDetailScreen> {
  EventsDetailController controller = Get.put(EventsDetailController());
  bool blockScroll = false;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: GetBuilder<EventsDetailController>(
            init: EventsDetailController(),
            builder: (controller) =>
                Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: CustomScrollView(
                          shrinkWrap: true,
                          primary: true,
                          physics: blockScroll
                              ? NeverScrollableScrollPhysics()
                              : BouncingScrollPhysics(),
                          slivers: [
                            SliverAppBar(
                              toolbarHeight: 68.v,
                              backgroundColor: Colors.transparent,
                              expandedHeight: 285.v,
                              leadingWidth: 68.h,
                              leading: Padding(
                                  padding: EdgeInsets.only(left: 20.h, top: 16.v),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      height: 48.v,
                                      width: 48.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.h),
                                          color: appTheme.whiteA700
                                              .withOpacity(0.20)),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.h),
                                        child: CustomImageView(
                                          imagePath:
                                          ImageConstant.imgGroup1171274870,
                                        ),
                                      ),
                                    ),
                                  )),
                              centerTitle: true,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Container(
                                    height: 285.v,
                                    child: Stack(
                                      children: [
                                        PageView.builder(
                                          onPageChanged: (value) {
                                            controller.currentPage = value;
                                            controller.update();
                                          },
                                          controller: controller.pageController,
                                          itemCount: 2,
                                          itemBuilder: (context, index) {
                                            return CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgFunnyStartsKi5,
                                              height: double.infinity,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.h, bottom: 16.v),
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                  width: 64.h,
                                                  height: 27.v,
                                                  decoration: AppDecoration.white
                                                      .copyWith(
                                                      borderRadius:
                                                      BorderRadiusStyle
                                                          .circleBorder10),
                                                  child: Center(
                                                    child: Text("8 KM",
                                                        style: theme
                                                            .textTheme.bodySmall!
                                                            .copyWith(
                                                            color: theme
                                                                .colorScheme
                                                                .onErrorContainer)),
                                                  ))),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildListDelegate([
                                ListView(
                                  padding: EdgeInsets.only(
                                      left: 20.h, right: 20.h, bottom: 120.v),
                                  primary: false,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    SizedBox(
                                      height: 16.v,
                                    ),
                                    // buildReviews(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "msg_football_tournament2".tr,
                                          style: CustomTextStyles.titleLarge22,
                                        ),
                                        Text(
                                          "lbl_100_00".tr,
                                          style: CustomTextStyles.titleLargePrimary,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12.v),
                                    ExpandableText(
                                      "msg_ultricies_arcu_venenatis2".tr +
                                          "msg_ultricies_arcu_venenatis2".tr,
                                      expandText: "lbl_read_more".tr,
                                      collapseText: 'Read less',
                                      maxLines: 3,
                                      linkColor:appTheme.buttonColor,
                                      style: theme.textTheme.bodyLarge!.copyWith(
                                          color:appTheme.black900
                                      ),
                                      linkStyle:
                                      theme.textTheme.titleMedium!.copyWith(
                                        color: appTheme.buttonColor,
                                        fontSize: 16.fSize,
                                      ),
                                    ),
                                    SizedBox(height: 28.v),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant.imgEllipse920,
                                            height: 60.adaptSize,
                                            width: 60.adaptSize,
                                            radius: BorderRadius.circular(
                                              30.h,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 7.v,
                                              bottom: 4.v,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "lbl_main_ground".tr,
                                                  style: CustomTextStyles.titleMediumBlack900,
                                                ),
                                                SizedBox(height: 7.v),
                                                Text(
                                                  "msg_5_min_venenatis".tr,
                                                  style: CustomTextStyles.bodyLargeGray60001,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 24.v),
                                    buildDetails(),
                                    SizedBox(height: 24.v),
                                    Text(
                                      "lbl_previous_memory".tr,
                                      style: theme.textTheme.titleLarge!.copyWith(
                                          color:appTheme.black900
                                      ),
                                    ),
                                    SizedBox(height: 16.v),
                                    GridView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount:  controller.previouseMemory.length>4?4:controller.previouseMemory.length,
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 186.v,
                                          crossAxisCount:2,
                                          mainAxisSpacing: 8.h,
                                          crossAxisSpacing: 8.h),
                                      itemBuilder: (context, index) {
                                        EventsdetailItemModel model = controller.previouseMemory[index];
                                        return EventsdetailItemWidget(model,index);
                                      },
                                    ),

                                  ],
                                ),
                              ]),
                            ),
                          ],
                        ))
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: appTheme.bgColor,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 16.v, bottom: 32.v, left: 20.h, right: 20.h),
                      child: buildButtons(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }




  /// Section Widget
  Widget buildDetails() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        color: appTheme.textfieldFillColor,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          _buildEntryFee(
            entryFee: "msg_last_day_of_registration".tr,
            price: "lbl_15_may_2023".tr,
          ),
          SizedBox(height: 18.v),
          _buildEntryFee(
            entryFee: "lbl_entry_fee".tr,
            price: "lbl_120_00".tr,
          ),
          SizedBox(height: 18.v),
          _buildEntryFee(
            entryFee: "msg_tournament_start".tr,
            price: "lbl_25_may_2023".tr,
          ),
          SizedBox(height: 18.v),
          _buildEntryFee(
            entryFee: "lbl_time".tr,
            price: "msg_11_00_pm_12_00".tr,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildButtons() {
    return CustomElevatedButton(
      onPressed: (){
        Get.toNamed(AppRoutes.eventsDetailTwoScreen);
      },
      text: "lbl_continue".tr,
    );
  }

  /// Common widget
  Widget _buildEntryFee({
    required String entryFee,
    required String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            entryFee,
            style: CustomTextStyles.bodyLargeGray60001.copyWith(
              color: appTheme.gray60001,
            ),
          ),
        ),
        Text(
          price,
          style: CustomTextStyles.titleMedium16.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
}


