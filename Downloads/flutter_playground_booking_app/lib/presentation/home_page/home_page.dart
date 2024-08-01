import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/detail_screen/detail_screen.dart';
import 'package:flutter_playground_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_playground_booking_app/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:flutter_playground_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_playground_booking_app/widgets/custom_icon_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_search_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../categories_screen/controller/categories_controller.dart';
import '../categories_screen/models/categories_item_model.dart';
import '../categories_screen/widgets/categories_item_widget.dart';
import '../nearby_you_screen/controller/nearby_you_controller.dart';
import '../nearby_you_screen/models/nearby_you_model.dart';
import '../popular_ground_screen/controller/popular_ground_controller.dart';
import '../popular_ground_screen/models/popularground_item_model.dart';
import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());
  CategoriesController categoriesController = Get.put(CategoriesController());
  NearbyYouController nearbyYouController = Get.put(NearbyYouController());
  PopularGroundController popularGroundController =
      Get.put(PopularGroundController());
      final ApiService apiService = ApiService();

    @override
  void initState() {
    super.initState();
    // controller.turfList();
    controller.turfList();
  }
  
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      buildAppBar(),
      SizedBox(height: 16.v),
      _buildSearchbar(),
      SizedBox(height: 24.v),
      Expanded(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h),
              child: getViewAllRow("lbl_categories".tr, () {
                Get.toNamed(AppRoutes.categoriesScreen);
              }),
            ),
            SizedBox(height: 16.v),
            GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 118.v,
                    crossAxisCount: 4,
                    // mainAxisSpacing: 16.h,
                    // crossAxisSpacing: 16.h
                    ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: categoriesController.categoriesData.length > 4
                    ? 4
                    : categoriesController.categoriesData.length,
                itemBuilder: (context, index) {
                  CategoriesItemModel model =
                      categoriesController.categoriesData[index];
                  return animationfunction(
                      index,
                      CategoriesItemWidget(model, onTapFootball: () {
                        Get.toNamed(AppRoutes.footBallScreen);
                      }));
                }),
            SizedBox(height: 24.v),
            Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h),
              child: getViewAllRow("lbl_popular_ground".tr, () {
                Get.toNamed(AppRoutes.popularGroundScreen);
              }),
            ),
            SizedBox(height: 16.v),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Row(
                  children: List.generate(
                      popularGroundController.popularGround.length > 2
                          ? 2
                          : popularGroundController.popularGround.length,
                      (index) {
                    PopulargroundItemModel data =
                        popularGroundController.popularGround[index];
                    return animationfunction(
                        index,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: GestureDetector(
                            onTap: () {
                              popularGroundController.currentImage.value =
                                  data.image!;
                              popularGroundController.update();
                              Get.toNamed(AppRoutes.detailScreen);
                            },
                            child: Container(
                              width: 260.h,
                              decoration: AppDecoration.fillGray.copyWith(
                                color: appTheme.textfieldFillColor,
                                borderRadius: BorderRadiusStyle.roundedBorder16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: data.image!,
                                    child: CustomImageView(
                                      imagePath: data.image,
                                      height: 126.v,
                                      width: double.infinity,
                                      radius: BorderRadius.circular(
                                        16.h,
                                      ),
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  SizedBox(height: 12.v),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.title!,
                                              style: theme
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                color: appTheme.black900,
                                              ),
                                            ),
                                            SizedBox(height: 4.5.v),
                                            Row(
                                              children: [
                                                CustomImageView(
                                                  color: appTheme.black900,
                                                  imagePath: ImageConstant
                                                      .imgIcLocation,
                                                  height: 20.adaptSize,
                                                  width: 20.adaptSize,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.h),
                                                  child: Text(data.location!,
                                                      style: theme
                                                          .textTheme.bodyMedium!
                                                          .copyWith(
                                                        color:
                                                            appTheme.black900,
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CustomImageView(
                                              imagePath: data.isBadminton!
                                                  ? ImageConstant
                                                      .imgShuttlecock31
                                                  : ImageConstant
                                                      .imgShuttlecock1,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize,
                                            ),
                                            SizedBox(width: 8.h),
                                            CustomImageView(
                                              imagePath: data.isCricket!
                                                  ? ImageConstant
                                                      .imgBall1LightGreen400
                                                  : ImageConstant
                                                      .imgTennisBall1,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize,
                                            ),
                                            SizedBox(width: 8.h),
                                            CustomImageView(
                                              imagePath: data.isFootball!
                                                  ? ImageConstant.imgBasketBall
                                                  : ImageConstant.imgBasketBall,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16.5.v),
                                ],
                              ),
                            ),
                          ),
                        ));
                  }),
                ),
              ),
            ),
            SizedBox(height: 24.v),
            Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h),
              child: getViewAllRow("lbl_nearby_you".tr, () {
                Get.toNamed(AppRoutes.nearbyYouScreen);
              }),
            ),
            SizedBox(height: 16.v),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Row(
                  children: List.generate(
                      nearbyYouController.nearlyYoudata.length > 2
                          ? 2
                          : nearbyYouController.nearlyYoudata.length, (index) {
                    NearbyYouModel data =
                        nearbyYouController.nearlyYoudata[index];
                    return animationfunction(
                        index,
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.h),
                            child: GestureDetector(
                              onTap: () {
                                popularGroundController.currentImage.value =
                                    data.image!;
                                popularGroundController.update();
                                Get.toNamed(AppRoutes.detailScreen);
                                DetailScreen();
                              },
                              child: Container(
                                  width: 298.h,
                                  decoration: AppDecoration.fillGray.copyWith(
                                      color: appTheme.textfieldFillColor,
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder16),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildSeventeen(
                                            image: data.image!,
                                            distance: data.diatance!),
                                        SizedBox(height: 12.v),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.h),
                                            child: Text(data.title!,
                                                style: theme
                                                    .textTheme.titleMedium!
                                                    .copyWith(
                                                        color: appTheme
                                                            .black900))),
                                        SizedBox(height: 5.v),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.h),
                                          child: Row(
                                            children: [
                                              CustomImageView(
                                                color: appTheme.black900,
                                                imagePath:
                                                    ImageConstant.imgIcLocation,
                                                height: 20.adaptSize,
                                                width: 20.adaptSize,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.h),
                                                child: Text(data.location!,
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                      color: appTheme.black900,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 16.v),
                                      ])),
                            )));
                  }),
                ),
              ),
            ),
            SizedBox(height: 24.v),
          ],
        ),
      ),
      // FloatingActionButton(onPressed: (){} , child: Icon(Icons.add),backgroundColor: Colors.blue,)
    ]);
  }

  /// Section Widget
  buildAppBar() {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, right: 20.h),
      child: CustomAppBar(
          height: 72.v,
          title: Column(children: [
            AppbarSubtitleOne(
                // text: "lbl_hello_jane".tr +storedValue,
                text: "lbl_hello_jane".tr,
                margin: EdgeInsets.only(right: 79.h)),
            SizedBox(height: 5.v),
            AppbarSubtitle(text: "lbl_good_morning".tr)
          ]),
          actions: [
            getCustomIconButton(ImageConstant.imgGroup9, () {
              Get.toNamed(AppRoutes.notificationScreen);
            })
          ]),
    );
  }

void fetchUserProfile() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int userId = prefs.getInt('user_id') ?? 0;
  final response = await apiService.getAPI('user_profile?user_id=${userId}');
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    String firstName = data['first_name'] ?? '';
    print(firstName);
    print(response.body);
  }
  else{
    print('error loading profile');
  }
}
  /// Section Widget
  Widget _buildSearchbar() {
    return Padding(
        padding: EdgeInsets.only(right: 20.h, left: 20.h),
        child: Row(children: [
          Expanded(
              child: CustomSearchView(
                  onTap: () {
                    Get.toNamed(AppRoutes.searchScreen);
                  },
                  textInputType: TextInputType.none,
                  controller: controller.searchController,
                  hintText: "lbl_search".tr)),
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: CustomIconButton(
                  height: 56.adaptSize,
                  width: 56.adaptSize,
                  padding: EdgeInsets.all(16.h),
                  decoration: IconButtonStyleHelper.fillPrimary,
                  onTap: () {
                    onTapBtnIconButton();
                  },
                  child: CustomImageView(
                      imagePath: ImageConstant.imgGroup1171275017)))
        ]));
  }

  /// Common widget
  Widget buildFrame1({
    required String popularGround,
    required String viewAll,
    Function? onTapViewAll,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(popularGround,
          style: theme.textTheme.titleLarge!
              .copyWith(color: theme.colorScheme.onErrorContainer)),
      GestureDetector(onTap: () {
        onTapViewAll!.call();
      }),
      Padding(
          padding: EdgeInsets.only(bottom: 3.v),
          child: Text(viewAll,
              style: CustomTextStyles.bodyLargeGray60001
                  .copyWith(color: appTheme.gray60001)))
    ]);
  }

  /// Navigates to the notificationEmptyScreen when the action is triggered.
  onTapIconButton() {
    Get.toNamed(
      AppRoutes.notificationEmptyScreen,
    );
  }

  /// Navigates to the filterScreen when the action is triggered.
  onTapBtnIconButton() {
    Get.toNamed(
      AppRoutes.filterScreen,
    );
  }

  /// Navigates to the categoriesScreen when the action is triggered.
  onTapTxtViewAll() {
    Get.toNamed(
      AppRoutes.categoriesScreen,
    );
  }

  /// Navigates to the popularGroundScreen when the action is triggered.
  onTapTxtViewAll1() {
    Get.toNamed(
      AppRoutes.popularGroundScreen,
    );
  }

  /// Navigates to the nearbyYouScreen when the action is triggered.
  onTapTxtViewAll2() {
    Get.toNamed(
      AppRoutes.nearbyYouScreen,
    );
  }

  Widget buildSeventeen({
    required String image,
    required String distance,
  }) {
    return SizedBox(
        height: 163.v,
        width: double.infinity,
        child: Stack(alignment: Alignment.topRight, children: [
          Hero(
            tag: image,
            child: CustomImageView(
                imagePath: image,
                height: 163.v,
                width: double.infinity,
                radius: BorderRadius.circular(16.h),
                alignment: Alignment.center),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  margin: EdgeInsets.only(top: 12.v, right: 12.h),
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.v),
                  decoration: AppDecoration.white
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder10),
                  child: Text(distance,
                      style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.onErrorContainer))))
        ]));
  }
}
