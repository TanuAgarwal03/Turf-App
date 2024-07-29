import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_icon_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_search_view.dart';
import 'controller/search_controller.dart';
import 'models/search_model.dart';




class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
 SearchControllers searchControllers = Get.put(SearchControllers());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
   backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
            width: double.maxFinite,
            child: GetBuilder<SearchControllers>(
              init: SearchControllers(),
              builder:(controller) =>  Column(children: [
           getCommonAppBar("lbl_search".tr),
               SizedBox(height: 16.v),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Expanded(
                          child: CustomSearchView(
                            onFieldSubmitted: (p0) {
                              controller.searchModelList.add(SearchModel(p0));
                              controller.searchController.clear();
                              controller.update();
                            },
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
                    ])),
               SizedBox(height: 27.v),
               Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                       padding: EdgeInsets.only(left: 20.h),
                       child: Text("lbl_recent".tr,
                           style: theme.textTheme.titleLarge!.copyWith(
                                color: appTheme.black900,
                           )))),
               SizedBox(height: 18.v),

               ListView.builder(
                 padding: EdgeInsets.only(left: 20.h, right: 20.h),
                 primary: false,
                 shrinkWrap: true,
                 itemCount: controller.searchModelList.length,
                 itemBuilder: (context, index) {
                   SearchModel searchModel = controller.searchModelList[index];
                 return Padding(
                   padding:  EdgeInsets.symmetric(vertical: 12.v),
                   child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                     CustomImageView(
                         imagePath: ImageConstant.imgIcSearch,
                         height: 24.adaptSize,
                         width: 24.adaptSize),
                     Padding(
                         padding: EdgeInsets.only(left: 16.h, top: 3.v),
                         child: Text(searchModel.searchMessege!,
                             style: theme.textTheme.bodyLarge!
                                 .copyWith(color: appTheme.black900))),
                     Spacer(),
                     InkWell(
                       onTap: () {
                         controller.searchModelList.removeAt(index);
                         controller.update();
                       },
                       child: CustomImageView(

                           color: appTheme.black900,
                           imagePath: ImageConstant.imgIcCancel,
                           height: 24.adaptSize,
                           width: 24.adaptSize),
                     )
                   ]),
                 );
               },),
               SizedBox(height: 40.v),
               GestureDetector(
                 onTap: (){
                   controller.searchModelList.clear();
                    controller.update();
                 },
                 child: Text("lbl_clear_all".tr,
                     style: CustomTextStyles.titleMediumPrimaryBold),
               ),
               SizedBox(height: 5.v)
              ]),
            )),
      ));
 }



 /// Navigates to the homeContainerScreen when the action is triggered.
 onTapSearch() {
  Get.toNamed(
   AppRoutes.homeContainerScreen,
  );
 }

 /// Navigates to the filterScreen when the action is triggered.
 onTapBtnIconButton() {
  Get.toNamed(
   AppRoutes.filterScreen,
  );
 }
}





