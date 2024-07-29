// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_icon_button.dart';
import 'controller/ground_category_controller.dart';
import 'models/ground_category_model.dart';

class GroundCategoryScreen extends StatefulWidget {
  const GroundCategoryScreen({super.key});

  @override
  State<GroundCategoryScreen> createState() => _GroundCategoryScreenState();
}

class _GroundCategoryScreenState extends State<GroundCategoryScreen> {
  GroundCategoryController controller = Get.put(GroundCategoryController());

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
        body: SafeArea(
            child: GetBuilder<GroundCategoryController>(
          init: GroundCategoryController(),
          builder: (controller) => Column(
            children: [
              getCommonAppBar("Ground category"),
              SizedBox(height: 8.v),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: controller.groundCategoryList.length,
                  itemBuilder: (context, index) {
                    GroundCategoryModel data =
                        controller.groundCategoryList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.v),
                      child: GestureDetector(
                        onTap: () {
                          controller.currentCategoryId = data.id!;
                          controller.update();
                        },
                        child: Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: AppDecoration.fillGray.copyWith(
                                color: appTheme.textfieldFillColor,
                                borderRadius: BorderRadiusStyle.roundedBorder16),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomIconButton(
                                          height: 48.adaptSize,
                                          width: 48.adaptSize,
                                          padding: EdgeInsets.all(12.h),
                                          decoration: IconButtonStyleHelper
                                              .fillPrimaryContainerTL24,
                                          child: CustomImageView(
                                              imagePath: data.icon!)),
                                      SizedBox(width: 16.h),
                                      Text(
                                        data.title!,
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(color: appTheme.black900),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.h),
                                    child: CustomImageView(
                                        imagePath: controller.currentCategoryId ==
                                                data.id
                                            ? ImageConstant.imgRadioButtonSelected
                                            : ImageConstant
                                                .imgRadioButtonunSelected),
                                  )
                                ])),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        ),
          bottomNavigationBar: buildButtons()
      ),
    );
  }


  /// Section Widget
  Widget buildContinue() {
    return Padding(
      padding:  EdgeInsets.only(left:20.h,right: 20.h, bottom: 32.v,top: 16.v),
      child: CustomElevatedButton(
          text: "lbl_continue".tr,
          onPressed: () {
            onTapContinue();
          }),
    );
  }

  /// Section Widget
  Widget buildButtons() {
    return Container(
       width: double.infinity,
        color: appTheme.bgColor,
        child: buildContinue());
  }

  /// Navigates to the addGroundScreen when the action is triggered.
  onTapGroundCategory() {
    Get.toNamed(
      AppRoutes.addGroundScreen,
    );
  }

  /// Navigates to the addPhotosScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.addPhotosScreen,
    );
  }
}
