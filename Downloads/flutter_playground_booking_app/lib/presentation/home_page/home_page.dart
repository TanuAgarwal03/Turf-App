import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/nearby_you_screen/models/nearby_you_model.dart';
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
    controller.turfList();
    // popularGroundController.
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
                      mainAxisExtent: 140.v,
                      crossAxisCount: 4,
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
                          CategoriesItemWidget(model, onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setInt('categoryId', model.id);
                            Get.toNamed(AppRoutes.footBallScreen,
                                arguments: model.id);
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
                                onTap: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setInt(
                                      'selectedTurfId', data.id ?? 0);
                                  popularGroundController.currentImage.value =
                                      data.image!;
                                  popularGroundController.update();
                                  Get.toNamed(AppRoutes.detailScreen,
                                      arguments: data.id);
                                },
                                child: Container(
                                  width: 240.h,
                                  decoration: AppDecoration.fillGray.copyWith(
                                    color: appTheme.textfieldFillColor,
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: data.image!,
                                        child: CustomImageView(
                                          fit: BoxFit.cover,
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.h),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.title!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                      height: 15.adaptSize,
                                                      width: 15.adaptSize,
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5.h),
                                                        child: Container(
                                                          width: 155,
                                                          child: Text(
                                                              data.location!,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                color: appTheme
                                                                    .black900,
                                                              )),
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
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
                            : nearbyYouController.nearlyYoudata.length,
                        (index) {
                          final NearbyYouModel data =
                              nearbyYouController.nearlyYoudata[index];

                          return animationfunction(
                            index,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.h),
                              child: GestureDetector(
                                onTap: () {
                                  // popularGroundController.currentImage.value =
                                  //     data.image ?? '';
                                  nearbyYouController.update();
                                  Get.toNamed(AppRoutes.detailScreen);
                                },
                                child: Container(
                                  width: 298.h,
                                  decoration: AppDecoration.fillGray.copyWith(
                                    color: appTheme.textfieldFillColor,
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildSeventeen(
                                        image: data.image ??
                                            'assets/images/img_rectangle_395_8.png',
                                        distance:
                                            data.distance ?? "no distance",
                                      ),
                                      SizedBox(height: 12.v),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h),
                                        child: Text(
                                          data.title ?? "No title",
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                            color: appTheme.black900,
                                          ),
                                        ),
                                      ),
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
                                              child: Text(
                                                data.location ?? "no location",
                                                maxLines: 2,
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                  color: appTheme.black900,
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 16.v),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.v),
              ],
            ),
          ),
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
                // text: "lbl_hello_jane".tr,
                text: 'Hello User',
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

  onTapIconButton() {
    Get.toNamed(
      AppRoutes.notificationEmptyScreen,
    );
  }

  onTapBtnIconButton() {
    Get.toNamed(
      AppRoutes.filterScreen,
    );
  }

  onTapTxtViewAll() {
    Get.toNamed(
      AppRoutes.categoriesScreen,
    );
  }

  onTapTxtViewAll1() {
    Get.toNamed(
      AppRoutes.popularGroundScreen,
    );
  }

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
