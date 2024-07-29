import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import '../popular_ground_screen/widgets/popularground_item_widget.dart';
import 'controller/popular_ground_controller.dart';
import 'models/popularground_item_model.dart';



class PopularGroundScreen extends StatefulWidget {
  const PopularGroundScreen({super.key});

  @override
  State<PopularGroundScreen> createState() => _PopularGroundScreenState();
}

class _PopularGroundScreenState extends State<PopularGroundScreen> {
 PopularGroundController controller = Get.put(PopularGroundController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
   backgroundColor: appTheme.bgColor,

      body: SafeArea(
        child: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              getCommonAppBar("lbl_popular_ground".tr),
             SizedBox(height: 16.v),
             buildPopularGround(),
             SizedBox(height: 24.v)
            ])),
      ));
 }

 /// Section Widget
 Widget buildPopularGround() {
  return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.v);
              },
              itemCount: controller.populerGround.length,
              itemBuilder: (context, index) {
                PopulargroundItemModel model = controller
                    .populerGround[index];
                return animationfunction(
                    index,
                    PopulargroundItemWidget(model));
              })));
 }


}






