// ignore_for_file: deprecated_member_use

import 'controller/about_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';



class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  AboutUsController aboutUsController = Get.put(AboutUsController());
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCommonAppBar("lbl_about_us".tr),
             Expanded(
               child: Container(
                 child: ListView(
                   padding: EdgeInsets.symmetric(horizontal: 20.h),
                   children: [
                     Text(
                       "msg_what_is_the_finance".tr,
                       style: theme.textTheme.titleLarge!.copyWith(
                         color: appTheme.black900,
                       ),
                     ),
                     SizedBox(height: 17.v),
                     CustomImageView(
                       imagePath: ImageConstant.imgChicModernLux,
                       height: 160.v,
                       width: double.infinity,
                       radius: BorderRadius.circular(
                         16.h,
                       ),
                     ),
                     SizedBox(height: 18.v),
                     Container(
                       width: double.infinity,
                       margin: EdgeInsets.only(right: 14.h),
                       child: Text(
                         "msg_lorem_ipsum_dolor3".tr,
                         maxLines: 4,
                         overflow: TextOverflow.ellipsis,
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                     SizedBox(height: 16.v),
                     SizedBox(
                       width: double.infinity,
                       child: Text(
                         "msg_amet_minim_mollit".tr,
                         maxLines: 3,
                         overflow: TextOverflow.ellipsis,
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                     SizedBox(height: 16.v),
                     SizedBox(
                       width: double.infinity,
                       child: Text(
                         "msg_in_a_laoreet_purus".tr,
                         maxLines: 3,
                         overflow: TextOverflow.ellipsis,
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                     SizedBox(height: 16.v),
                     Container(
                       width: double.infinity,
                       margin: EdgeInsets.only(right: 12.h),
                       child: Text(
                         "msg_vorem_ipsum_dolor".tr,
                         maxLines: 4,
                         overflow: TextOverflow.ellipsis,
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                     SizedBox(height: 16.v),
                     Container(
                       width: double.infinity,
                       margin: EdgeInsets.only(right: 12.h),
                       child: Text(
                         "msg_vorem_ipsum_dolor".tr,
                         maxLines: 4,
                         overflow: TextOverflow.ellipsis,
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                     SizedBox(height: 15.v),
                     Container(
                       width:double.infinity,
                       margin: EdgeInsets.only(right: 36.h),
                       child: Text(
                         "msg_dctum_est_a_mattis".tr,
                         maxLines: 3,
                         overflow: TextOverflow.ellipsis,
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}



