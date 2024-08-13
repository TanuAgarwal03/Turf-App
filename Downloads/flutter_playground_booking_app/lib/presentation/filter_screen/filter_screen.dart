import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_outlined_button.dart';
import '../categories_screen/controller/categories_controller.dart';
import '../categories_screen/models/categories_item_model.dart';
import '../categories_screen/widgets/categories_item_widget.dart';
import 'controller/filter_controller.dart';
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
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCommonAppBar("lbl_filter".tr),
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.only(left: 20.h, right: 20.h),
                  child: Text(
                    "lbl_categories".tr,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: appTheme.black900,
                    ),
                  ),
                ),
                SizedBox(height: 16.v),
                // Obx(() {
                //   return GridView.builder(
                //     padding: EdgeInsets.symmetric(horizontal: 20.h),
                //     shrinkWrap: true,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       mainAxisExtent: 120.v,
                //       crossAxisCount: 4,
                //     ),
                //     physics: NeverScrollableScrollPhysics(),
                //     itemCount: categoriesController.categoriesData
                //         .where((category) => category.title != 'Uncategorized')
                //         .toList()
                //         .length,
                //     itemBuilder: (context, index) {
                //       var filteredCategories =
                //           categoriesController.categoriesData
                //               .where((category) =>
                //                   category.title != 'Uncategorized')
                //               .toList();
                //       CategoriesItemModel model = filteredCategories[index];
                //       bool isSelected =
                //           controller.currentCategory.value == model.id;
                //       return animationfunction(
                //         index,
                //         CategoriesItemWidget(
                //           model,
                //           onTap: () {
                //             controller.setSelectedCategory(model.id);
                //           },
                //           isSelected: isSelected,
                //         ),
                //       );
                //     },
                //   );
                // }),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 120.v,
                    crossAxisCount: 4,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categoriesController.categoriesData
                      .where((category) => category.title != 'Uncategorized')
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    var filteredCategories = categoriesController.categoriesData
                        .where((category) => category.title != 'Uncategorized')
                        .toList();
                    CategoriesItemModel model = filteredCategories[index];
                    bool isSelected =
                        controller.currentCategory.value == model.id;
                    return animationfunction(
                      index,
                      CategoriesItemWidget(
                        model,
                        onTap: () {
                          controller.setSelectedCategory(model.id);
                        },
                        isSelected: isSelected,
                      ),
                    );
                  },
                ),
                SizedBox(height: 28.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "lbl_price_range".tr,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: appTheme.black900,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Text(
                      'Select Price Range to display turfs in that range :'),
                ),
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
                    crossAxisSpacing: 16.h,
                  ),
                  itemBuilder: (context, index) {
                    PriceRangeModel model = controller.priceList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.onSelectPriceRange(model.id!,
                            100 + (index * 150), 100 + ((index + 1) * 150));
                        controller.update();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.h),
                          border: Border.all(
                              color: controller.currentPrice == model.id
                                  ? appTheme.buttonColor
                                  : Colors.transparent),
                          color: controller.currentPrice == model.id
                              ? appTheme.buttonColor.withOpacity(0.20)
                              : appTheme.textfieldFillColor,
                        ),
                        child: Center(
                          child: Text(
                            model.priceRange!,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: appTheme.black900,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 28.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "List of Turfs",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: appTheme.black900,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Obx(() {
                  if (controller.filteredGrounds.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Center(
                        child: Text(
                          "No turfs available in the selected price range.",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: appTheme.black900,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      shrinkWrap: true,
                      itemCount: controller.filteredGrounds.length,
                      itemBuilder: (context, index) {
                        var ground = controller.filteredGrounds[index];
                        int turfId = ground['id'];
                        return Card(
                          child: ListTile(
                            leading: ClipRRect(
                              child: Image.network(
                                ground['acf']['turf_image'],
                                fit: BoxFit.cover,
                                width: 70,
                                height: 50,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text(ground['title']),
                            subtitle: Text(ground['acf']['address'] ?? ''),
                            trailing: Text("\$${ground['acf']['price']}"),
                            onTap: () {
                              Get.toNamed(AppRoutes.detailScreen , arguments: {'id': turfId},);
                            },
                          ),
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: buildButtons(),
      ),
    );
  }

  Widget buildApply() {
    return Expanded(
      child: CustomElevatedButton(
        text: "lbl_apply".tr,
        margin: EdgeInsets.only(left: 8.h),
        onPressed: () {},
      ),
    );
  }

  Widget buildReset() {
    return Expanded(
      child: CustomOutlinedButton(
        text: "lbl_reset".tr,
        margin: EdgeInsets.only(right: 8.h),
        onPressed: () {
          controller.resetFilters();
        },
      ),
    );
  }

  Widget buildButtons() {
    return Container(
      width: double.infinity,
      color: appTheme.bgColor,
      padding:
          EdgeInsets.only(left: 20.h, right: 20.h, bottom: 32.v, top: 16.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildReset()
        ],
      ),
    );
  }

  onTapTxtViewAll() {
    Get.toNamed(
      AppRoutes.categoriesScreen,
    );
  }

  onTapReset() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  // onTapApply() {
  //   Get.toNamed(
  //     AppRoutes.homeContainerScreen,
  //   );
  // }
}
