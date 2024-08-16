import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../popular_ground_screen/controller/popular_ground_controller.dart';
import '../review_screen/controller/review_controller.dart';
import '../review_screen/models/review_item_model.dart';
import '../review_screen/widgets/review_item_widget.dart';
import 'controller/detail_controller.dart';
import 'models/detailscreen_item_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DetailController detailController;
  late ReviewController reviewController;
  late PopularGroundController popularGroundController;
  late int turfId;
  bool blockScroll = false;
  String? role;

  @override
  void initState() {
    super.initState();
    detailController = Get.put(DetailController());
    reviewController = Get.put(ReviewController());
    popularGroundController = Get.put(PopularGroundController());

    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        role = prefs.getString('role');
      });
    });

    final arguments = Get.arguments as Map<String, dynamic>;
    turfId = arguments['id'] as int;
    detailController.fetchTurfData(turfId);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    // ignore: deprecated_member_use
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
                builder: (controller) {
                  return FutureBuilder(
                      future: controller.fetchTurfData(turfId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.blue,
                              size: 50,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          final detailModel =
                              detailController.detailModel.value;
                          return Stack(
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
                                            padding: EdgeInsets.only(
                                                left: 20.h, top: 16.v),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Container(
                                                height: 48.v,
                                                width: 48.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.h),
                                                    color: appTheme
                                                        .blackTransperant
                                                        .withOpacity(0.30)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.h),
                                                  child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgGroup1171274870,
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
                                                      controller.currentPage =
                                                          value;
                                                      controller.update();
                                                    },
                                                    controller: controller
                                                        .pageController,
                                                    itemCount: 1,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Hero(
                                                        tag:
                                                            popularGroundController
                                                                .currentImage,
                                                        child: CustomImageView(
                                                          imagePath:
                                                              detailModel.image,
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                      SliverList(
                                        delegate: SliverChildListDelegate([
                                          ListView(
                                            padding: EdgeInsets.only(
                                                left: 20.h,
                                                right: 20.h,
                                                bottom: 120.v),
                                            primary: false,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            children: [
                                              SizedBox(
                                                height: 16.v,
                                              ),
                                              buildReviews(),
                                              SizedBox(height: 12.v),
                                              ExpandableText(
                                                detailModel.description,
                                                expandText: "lbl_read_more".tr,
                                                collapseText: 'Read less',
                                                maxLines: 3,
                                                linkColor: appTheme.buttonColor,
                                                style: theme
                                                    .textTheme.bodyLarge!
                                                    .copyWith(
                                                        color:
                                                            appTheme.black900),
                                                linkStyle: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                  color: appTheme.buttonColor,
                                                  fontSize: 16.fSize,
                                                ),
                                              ),
                                              SizedBox(height: 24.v),
                                              Text(
                                                "lbl_facilities".tr,
                                                style: theme
                                                    .textTheme.titleLarge!
                                                    .copyWith(
                                                        color:
                                                            appTheme.black900),
                                              ),
                                              SizedBox(height: 19.v),
                                              GridView.builder(
                                                primary: false,
                                                shrinkWrap: true,
                                                itemCount: controller
                                                    .facilityList.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        mainAxisExtent: 85.v,
                                                        crossAxisCount: 4,
                                                        mainAxisSpacing: 16.h,
                                                        crossAxisSpacing: 16.h),
                                                itemBuilder: (context, index) {
                                                  DetailscreenItemModel model =
                                                      controller
                                                          .facilityList[index];
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.h),
                                                      color: appTheme
                                                          .textfieldFillColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.h),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 40.v,
                                                            width: 40.h,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: appTheme
                                                                    .whiteA700),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.h),
                                                              child:
                                                                  CustomImageView(
                                                                imagePath:
                                                                    model.icon,
                                                                height: 24
                                                                    .adaptSize,
                                                                width: 24
                                                                    .adaptSize,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10.v,
                                                          ),
                                                          Text(model.title!,
                                                              maxLines: 1,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: CustomTextStyles
                                                                  .bodyMediumOnErrorContainer
                                                                  .copyWith(
                                                                      color: appTheme
                                                                          .black900)),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(height: 40.v),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(bottom: 20.0),
                                                child: Text(
                                                    "Gallery",
                                                    style: theme
                                                        .textTheme.titleLarge!
                                                        .copyWith(
                                                            color: appTheme
                                                                .black900),
                                                  ),
                                              ),
                                              if (controller
                                                  .galleryImages.isNotEmpty)
                                                GridView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 8.0,
                                                    mainAxisSpacing: 8.0,
                                                  ),
                                                  itemCount: controller
                                                      .galleryImages.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final imageUrl = controller
                                                        .galleryImages[index];
                                                    return ClipRRect(
                                                      borderRadius: BorderRadius.circular(15.0),
                                                      child: Image.network(
                                                        imageUrl,
                                                        width: 50,
                                                        height: 50,
                                                        fit: BoxFit.cover)
                                                    );
                                                  },
                                                )
                                              else
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      'No images available'),
                                                ),
                                                SizedBox(height: 30.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "lbl_reviews".tr,
                                                    style: theme
                                                        .textTheme.titleLarge!
                                                        .copyWith(
                                                            color: appTheme
                                                                .black900),
                                                  ),
                                                  InkWell(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.edit,
                                                          size: 15,
                                                        ),
                                                        Text('Add Review')
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppRoutes
                                                              .writeAReviewScreen,
                                                          arguments: turfId);
                                                    },
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 16.v),
                                              Container(
                                                  height: 400,
                                                  child: ListView.builder(
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    primary: false,
                                                    itemCount: detailController
                                                        .reviewList.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      ReviewItemModel model =
                                                          detailController
                                                                  .reviewList[
                                                              index];
                                                      return Column(
                                                        children: [
                                                          ReviewItemWidget(
                                                              model),
                                                          if (index <
                                                              detailController
                                                                      .reviewList
                                                                      .length -
                                                                  1)
                                                            SizedBox(
                                                                height: 15),
                                                        ],
                                                      );
                                                    },
                                                  )),
                                              SizedBox(height: 26.v),
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
                                        top: 16.v,
                                        bottom: 32.v,
                                        left: 20.h,
                                        right: 20.h),
                                    child: buildButtons(),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      });
                })),
      ),
    );
  }

  Widget buildReviews() {
    final detailModel = detailController.detailModel.value;
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
              child: Text(" ${detailController.averageRating} Rating ",
                  style: CustomTextStyles.bodyLargeGray60001)),
          Padding(
              padding: EdgeInsets.only(left: 1.h, top: 3.v),
              child: Text(" (${detailController.totalReviews} reviews) ",
                  style: CustomTextStyles.bodyLargeGray60001))
        ]),
        SizedBox(height: 12.v),
        Text(detailModel.title, style: CustomTextStyles.titleLarge22)
      ])),
      Padding(
          padding: EdgeInsets.only(left: 21.h, bottom: 38.v),
          child: Text("\$${detailModel.price}.00",
              style: CustomTextStyles.titleLargePrimary)),
    ]);
  }

  Widget buildButtons() {
    return CustomElevatedButton(
        text: "lbl_book_now".tr,
        onPressed: () {
          if (role == 'owner') {
            Get.snackbar('Sorry..!!', 'You cannot book as a owner');
          } else {
            onTapBookNow();
          }
        });
  }

  onTapTxtViewAll() {
    print('On tap view all');
    print(turfId);
    Get.toNamed(AppRoutes.reviewScreen, arguments: turfId);
  }

  onTapBookNow() {
    Get.toNamed(AppRoutes.selectDateTimeScreen, arguments: {
      'turfId': turfId,
    });
  }

  Widget buildFacilities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Facilities",
          style: theme.textTheme.titleLarge!.copyWith(color: appTheme.black900),
        ),
        SizedBox(height: 19.v),
        GridView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: detailController.facilityList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.h,
          ),
          itemBuilder: (context, index) {
            DetailscreenItemModel model = detailController.facilityList[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.h),
                color: appTheme.textfieldFillColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40.v,
                      width: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appTheme.whiteA700,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.h),
                        child: CustomImageView(
                          imagePath: model.icon,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Text(
                      model.title!,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style:
                          CustomTextStyles.bodyMediumOnErrorContainer.copyWith(
                        color: appTheme.black900,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
