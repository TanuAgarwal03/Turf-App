// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_outlined_button.dart';
import '../categories_screen/controller/categories_controller.dart';
import '../categories_screen/models/categories_item_model.dart';
import '../categories_screen/widgets/categories_item_widget.dart';
import 'controller/filter_controller.dart';
import 'models/ground_type_model.dart';
import 'models/price_range_model.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  FilterController controller = Get.put(FilterController());
  CategoriesController categoriesController = Get.put(CategoriesController());

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
            child: GetBuilder<FilterController>(
              init: FilterController(),
              builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              getCommonAppBar("lbl_filter".tr),
                SizedBox(height: 20.v),
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
                        mainAxisExtent: 120.v,
                        crossAxisCount: 4,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.h),
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
                SizedBox(height: 28.v),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text("lbl_price_range".tr,
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: appTheme.black900,
                            )))),
                SizedBox(height: 17.v),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: controller.priceList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 56.v,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.h),
                  itemBuilder: (context, index) {
                    PriceRangeModel model = controller.priceList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.currentPrice = model.id!;
                        controller.update();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.h),
                              border: Border.all(color: controller.currentPrice == model.id?appTheme.buttonColor:Colors.transparent),
                              color:  controller.currentPrice == model.id?appTheme.buttonColor.withOpacity(0.20):appTheme.textfieldFillColor),
                          child: Center(
                              child: Text(
                            model.priceRange!,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: appTheme.black900,
                            ),
                          ))),
                    );
                  },
                ),
                SizedBox(height: 28.v),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text("lbl_ground_type".tr,
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: appTheme.black900,
                            )))),
                SizedBox(height: 17.v),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.h),
                    child: Row(
                      children:List.generate(
                          controller.groundList.length,  (index) {
                        GroundTypeModel model = controller.groundList[index];
                        return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 12.h),
                          child: GestureDetector(
                            onTap: (){
                              controller.currentGroundType = model.id!;
                              controller.update();
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  CustomImageView(
                                    imagePath: controller.currentGroundType == model.id!?ImageConstant.imgRadioButtonSelected:ImageConstant.imgRadioButtonunSelected,
                                  ),
                                  SizedBox(width: 16.h),
                                  Text(model.title!,style: theme.textTheme.bodyLarge!.copyWith(
                                    color: appTheme.black900,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                    ),
                  ),
                ),

              ]),
            ),
          ),
          bottomNavigationBar: buildButtons()),
    );
  }


  /// Section Widget
  Widget buildReset() {
    return Expanded(
        child: CustomOutlinedButton(
            text: "lbl_reset".tr,
            margin: EdgeInsets.only(right: 8.h),
            onPressed: () {
             Get.back();
            }));
  }

  /// Section Widget
  Widget buildApply() {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_apply".tr,
            margin: EdgeInsets.only(left: 8.h),
            onPressed: () {
              Get.back();
            }));
  }

  /// Section Widget
  Widget buildButtons() {
    return Container(
      width: double.infinity,
        color: appTheme.bgColor,
        padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 32.v,top: 16.v),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildReset(), buildApply()]));
  }



  /// Navigates to the categoriesScreen when the action is triggered.
  onTapTxtViewAll() {
    Get.toNamed(
      AppRoutes.categoriesScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapReset() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapApply() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
