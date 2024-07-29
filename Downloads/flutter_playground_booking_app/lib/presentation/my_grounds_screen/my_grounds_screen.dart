// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import '../my_grounds_screen/widgets/mygrounds_item_widget.dart';
import 'controller/my_grounds_controller.dart';
import 'models/my_grounds_model.dart';
import 'models/mygrounds_item_model.dart';





class MyGroundsScreen extends StatefulWidget {
  const MyGroundsScreen({super.key});

  @override
  State<MyGroundsScreen> createState() => _MyGroundsScreenState();
}

class _MyGroundsScreenState extends State<MyGroundsScreen> {
 MyGroundsController controller = Get.put(MyGroundsController());
 MyGroundsModel myGroundsModel = Get.put(MyGroundsModel());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
    onWillPop: () async{
      Get.back();
      return true;
    },
    child: Scaffold(
       backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
               getCommonAppBar("lbl_my_grounds".tr),
               SizedBox(height: 16.v),
               buildMyGrounds(),
               Spacer()
              ])),
        ),
        bottomNavigationBar: buildButtons()),
  );
 }


 /// Section Widget
 Widget buildMyGrounds() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.v);
          },
          itemCount: controller.myGroundList.length,
          itemBuilder: (context, index) {
            MygroundsItemModel model = controller.myGroundList[index];
            return MygroundsItemWidget(model);
          }));
 }

 /// Section Widget
 Widget buildButtons() {
  return Container(
    width: double.infinity,
    color: appTheme.bgColor,
      child: Padding(
        padding: EdgeInsets.only(top: 16.v,bottom: 32.v,left: 20.h,right: 20.h),
        child: CustomElevatedButton(
            text: "lbl_add".tr,
            onPressed: () {
             onTapAdd();
            }),
      ));
 }

 /// Navigates to the groundCategoryScreen when the action is triggered.
 onTapAdd() {
  Get.toNamed(
   AppRoutes.addGroundScreen,
   // AppRoutes.groundCategoryScreen,
  );
 }
}



