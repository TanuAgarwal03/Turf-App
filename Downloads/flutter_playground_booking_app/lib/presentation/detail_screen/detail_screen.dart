// ignore_for_file: deprecated_member_use

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/detail_screen/widgets/detailscreen_item_widget.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import '../popular_ground_screen/controller/popular_ground_controller.dart';
import '../review_screen/controller/review_controller.dart';
import '../review_screen/models/review_item_model.dart';
import '../review_screen/widgets/review_item_widget.dart';
import 'controller/detail_controller.dart';
import 'models/detailscreen_item_model.dart';
import 'models/ground_list_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailController detailController = Get.put(DetailController());
  ReviewController reviewController = Get.put(ReviewController());
  PopularGroundController popularGroundController = Get.put(PopularGroundController());
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
          child: GetBuilder<DetailController>(
            init: DetailController(),
            builder: (controller) => Stack(
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
                                      color: appTheme.blackTransperant
                                          .withOpacity(0.30)),
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
                          actions: [
                            Padding(
                                padding:
                                    EdgeInsets.only(right: 20.h, top: 16.v),
                                child: GestureDetector(
                                  onTap: (){},
                                  // onTap: () async {
                                  //   await Share.share(
                                  //       'Hello Welcome to FlutterCampus',
                                  //       subject: 'Welcome Message');
                                  // },
                                  child: Container(
                                    height: 48.v,
                                    width: 48.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.h),
                                        color: appTheme.blackTransperant
                                            .withOpacity(0.30)),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.h),
                                      child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgGroup1171274871,
                                      ),
                                    ),
                                  ),
                                )),
                          ],
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
                                        return Hero(
                                          tag: popularGroundController.currentimage,
                                          child: CustomImageView(
                                            imagePath:popularGroundController.currentimage,
                                            height: double.infinity,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
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
                                buildReviews(),
                                SizedBox(height: 12.v),
                                ExpandableText(
                                  "msg_ultricies_arcu_venenatis2".tr +
                                      "msg_ultricies_arcu_venenatis2".tr,
                                  expandText: "lbl_read_more".tr,
                                  collapseText: 'Read less',
                                  maxLines: 3,
                                  linkColor: appTheme.buttonColor,
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color:appTheme.black900
                                  ),
                                  linkStyle:
                                      theme.textTheme.titleMedium!.copyWith(
                                    color: appTheme.buttonColor,
                                    fontSize: 16.fSize,
                                  ),
                                ),
                                SizedBox(height: 24.v),
                                Text("lbl_facilities".tr,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                        color:appTheme.black900
                                    ),),
                                SizedBox(height: 19.v),
                                GridView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: controller.facilityList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 85.v,
                                          crossAxisCount: 4,
                                          mainAxisSpacing: 16.h,
                                          crossAxisSpacing: 16.h),
                                  itemBuilder: (context, index) {
                                    DetailscreenItemModel model =
                                        controller.facilityList[index];
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
                                SizedBox(height: 26.v),
                                Text("lbl_ground_list".tr,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                        color:appTheme.black900
                                    ),),
                                SizedBox(height: 19.v),
                                GridView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: controller.groundList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 180.v,
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 16.h,
                                          crossAxisSpacing: 17.h),
                                  itemBuilder: (context, index) {
                                    GroundListModel model =
                                        controller.groundList[index];
                                    return DetailscreenItemWidget(model);
                                  },
                                ),
                                SizedBox(height: 26.v),
                                getViewAllRow("lbl_reviews".tr, () {
                                  Get.toNamed(AppRoutes.reviewScreen);
                                }),
                                SizedBox(height: 16.v),
                                ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount:
                                        reviewController.reviewList.length > 1
                                            ? 1
                                            : reviewController
                                                .reviewList.length,
                                    itemBuilder: (context, index) {
                                      ReviewItemModel model =
                                          reviewController.reviewList[index];
                                      return ReviewItemWidget(model);
                                    }),
                                SizedBox(height: 26.v),
                                Text("msg_our_popular_features".tr,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                        color:appTheme.black900
                                    ),),
                                SizedBox(height: 19.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 67.h),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 10.adaptSize,
                                              width: 10.adaptSize,
                                              margin: EdgeInsets.only(
                                                  top: 4.v, bottom: 6.v),
                                              decoration: BoxDecoration(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.h))),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 12.h, top: 1.v),
                                              child: Text(
                                                  "lbl_hiring_partners".tr,
                                                  style: theme.textTheme.bodyLarge!.copyWith(
                                                    color: appTheme.black900,
                                                  ))),
                                          Spacer(),
                                          Container(
                                              height: 10.adaptSize,
                                              width: 10.adaptSize,
                                              margin: EdgeInsets.only(
                                                  top: 4.v, bottom: 6.v),
                                              decoration: BoxDecoration(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.h))),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.h),
                                              child: Text(
                                                  "lbl_miniature_field".tr,
                                                  style: theme.textTheme.bodyLarge!.copyWith(
                                                    color: appTheme.black900,
                                                  )))
                                        ])),
                                SizedBox(height: 19.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 51.h),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 10.adaptSize,
                                              width: 10.adaptSize,
                                              margin: EdgeInsets.only(
                                                  top: 3.v, bottom: 6.v),
                                              decoration: BoxDecoration(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.h))),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.h),
                                              child: Text("lbl_grass_pitch".tr,
                                                  style: theme.textTheme.bodyLarge!.copyWith(
                                                    color: appTheme.black900,
                                                  ))),
                                          Spacer(),
                                          Container(
                                              height: 10.adaptSize,
                                              width: 10.adaptSize,
                                              margin: EdgeInsets.only(
                                                  top: 3.v, bottom: 6.v),
                                              decoration: BoxDecoration(
                                                  color:
                                                      theme.colorScheme.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.h))),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.h),
                                              child: Text(
                                                  "msg_outdoor_indoor".tr,
                                                  style: theme.textTheme.bodyLarge!.copyWith(
                                                    color: appTheme.black900,
                                                  )))
                                        ])),
                                SizedBox(height: 20.v),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 10.adaptSize,
                                          width: 10.adaptSize,
                                          margin: EdgeInsets.only(
                                              top: 3.v, bottom: 6.v),
                                          decoration: BoxDecoration(
                                              color: theme.colorScheme.primary,
                                              borderRadius:
                                                  BorderRadius.circular(5.h))),
                                      Padding(
                                          padding: EdgeInsets.only(left: 12.h),
                                          child: Text(
                                              "msg_natural_grass_pitch".tr,
                                              style: theme.textTheme.bodyLarge!.copyWith(
                                                color: appTheme.black900,
                                              )))
                                    ]),
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
  Widget buildReviews() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgIcStar,
              height: 24.adaptSize,
              width: 24.adaptSize),
          Padding(
              padding: EdgeInsets.only(left: 7.h, top: 3.v),
              child: Text("msg_4_5_140_reviews".tr,
                  style: CustomTextStyles.bodyLargeGray60001))
        ]),
        SizedBox(height: 12.v),
        Text("msg_stadium_in_lights4".tr, style: CustomTextStyles.titleLarge22)
      ])),
      Padding(
          padding: EdgeInsets.only(left: 21.h, bottom: 38.v),
          child:
              Text("lbl_100_00".tr, style: CustomTextStyles.titleLargePrimary))
    ]);
  }


  /// Section Widget
  Widget buildButtons() {
    return CustomElevatedButton(
        text: "lbl_book_now".tr,
        onPressed: () {
          onTapBookNow();
        });
  }

  /// Navigates to the nearbyYouScreen when the action is triggered.
  onTapIconButton() {
    Get.toNamed(
      AppRoutes.nearbyYouScreen,
    );
  }

  /// Navigates to the reviewScreen when the action is triggered.
  onTapTxtViewAll() {
    Get.toNamed(
      AppRoutes.reviewScreen,
    );
  }

  /// Navigates to the selectDateTimeScreen when the action is triggered.
  onTapBookNow() {
    Get.toNamed(
      AppRoutes.selectDateTimeScreen,
    );
  }
}
