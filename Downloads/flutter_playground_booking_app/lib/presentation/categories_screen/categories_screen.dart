// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import '../categories_screen/widgets/categories_item_widget.dart';
import 'controller/categories_controller.dart';
import 'models/categories_item_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesController controller = Get.put(CategoriesController());

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
        child: Column(children: [
          getCommonAppBar("lbl_categories".tr),
          SizedBox(height: 16.v),
          _buildCategories()
        ]),
      )),
    );
  }



  /// Section Widget
  Widget _buildCategories() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 120.v,
                crossAxisCount: 4,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.categoriesData.length,
            itemBuilder: (context, index) {
              CategoriesItemModel model = controller.categoriesData[index];
              return animationfunction(
                  index,
                  CategoriesItemWidget(model, onTapFootball: () {
                    onTapFootball();
                  }));
            }));
  }

  /// Navigates to the footBallScreen when the action is triggered.
  onTapFootball() {
    Get.toNamed(AppRoutes.footBallScreen);
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapCategories() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
