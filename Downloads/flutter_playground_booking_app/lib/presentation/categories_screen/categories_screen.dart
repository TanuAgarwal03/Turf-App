import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/categories_screen/models/categories_item_model.dart';
import 'controller/categories_controller.dart';
import 'widgets/categories_item_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesController controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Column(
            children: [
              getCommonAppBar("lbl_categories".tr),
              SizedBox(height: 16.v),
              _buildCategories(),
            ],
          ),
        ),
      ),
    );
  }
Widget _buildCategories() {
  return Obx(() {
    final filteredCategories = controller.categoriesData
        .where((category) => category.title != "Uncategorized")
        .toList();

    if (filteredCategories.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 140.v,
            crossAxisCount: 4,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: filteredCategories.length,
          itemBuilder: (context, index) {
            CategoriesItemModel model = filteredCategories[index];
            return animationfunction(
              index,
              CategoriesItemWidget(
                model,
                onTap: () {
                  _onCategoryItemTap(model.id, model.title!);
                },
              ),
            );
          },
        ),
      );
    }
  });
}

  void _onCategoryItemTap(int categoryId , String title) {
    Get.toNamed(AppRoutes.footBallScreen,
     arguments: {
      // categoryId, 
      // title
      'categoryId' : categoryId,
      'title' : title
      }
      );
  }

  void onTapCategories() {
    Get.toNamed(AppRoutes.homeContainerScreen);
  }
}