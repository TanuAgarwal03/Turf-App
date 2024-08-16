import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_icon_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_search_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchControllers searchControllers = Get.put(SearchControllers());

  @override
  void initState() {
    super.initState();
    searchControllers.fetchAllTurfs();
    _loadTurfId();
  }

  Future<void> _loadTurfId() async {
    final prefs = await SharedPreferences.getInstance();
    final turfId = prefs.getInt('selectedTurfId') ?? 0;
    if (turfId != 0) {
      print("turf id from SharedPreferences : $turfId");
    } else {
      Get.snackbar("Error", "No turf ID found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: FutureBuilder<void>(
            future: searchControllers.fetchAllTurfs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.prograssiveDots(color: Colors.green, size: 50),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error loading data'),
                );
              } else {
                return GetBuilder<SearchControllers>(
                  builder: (controller) => Column(
                    children: [
                      getCommonAppBar("lbl_search".tr),
                      SizedBox(height: 16.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomSearchView(
                                onFieldSubmitted: (p0) {
                                  controller.searchTurfs(p0);
                                },
                                onChanged: (p0) {
                                  controller.searchTurfs(p0);
                                },
                                controller: controller.searchController,
                                hintText: "lbl_search".tr,
                              ),
                            ),
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
                                  imagePath: ImageConstant.imgGroup1171275017,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.v),
                      Expanded(
                        child: controller.filteredTurfs.isEmpty
                            ? Center(
                                child: Text(
                                  "Sorry!!! No matches found.\n Try another keyword.",
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: appTheme.gray600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.only(left: 20.h),
                                itemCount: controller.filteredTurfs.length,
                                itemBuilder: (context, index) {
                                  TurfModel turf = controller.filteredTurfs[index];
                                  return Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: ListTile(
                                      title: Text(
                                        turf.title,
                                        style: theme.textTheme.bodyLarge!.copyWith(
                                          color: appTheme.black900,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      subtitle: Text(
                                        turf.address,
                                        style: theme.textTheme.bodyMedium!.copyWith(
                                          color: appTheme.gray600,
                                        ),
                                      ),
                                      leading: CustomImageView(
                                        imagePath: ImageConstant.imgIcSearch,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize,
                                      ),
                                      onTap: (){
                                        int turfId = turf.id;
                                        Get.toNamed(AppRoutes.detailScreen , arguments: {'id': turfId});
                                      },
                                    ),
                                  );
                                },
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.searchController.clear();
                          controller.searchModelList.clear();
                          controller.filteredTurfs = controller.allTurfs;
                          controller.update();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.v),
                          child: Text(
                            "lbl_clear_all".tr,
                            style: CustomTextStyles.titleMediumPrimaryBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  onTapBtnIconButton() {
    Get.toNamed(AppRoutes.filterScreen);
  }
}
