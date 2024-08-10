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
                       'Welcome to Turf Locator!',
                       style: theme.textTheme.titleLarge!.copyWith(
                         color: appTheme.black900,
                       ),
                     ),
                     SizedBox(height: 27.v),
                     CustomImageView(
                       imagePath: 'assets/images/img_rectangle_395_5.png',
                       height: 160.v,
                       width: double.infinity,
                       radius: BorderRadius.circular(
                         16.h,
                       ),
                     ),
                     SizedBox(height: 30.v),
                     Container(
                       width: double.infinity,
                       margin: EdgeInsets.only(right: 14.h),
                       child: Text(
                         'Our mission is to connect you with the best turf locations around you. Our application provides comprehensive information on various turf locations, including their details, images, and user reviews, to help you find the perfect spot for your activities.',
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                     SizedBox(height: 16.v),
                     Text(
                       'Our Story',
                       style: theme.textTheme.titleLarge!.copyWith(
                         color: appTheme.black900,
                       ),
                     ),
                     SizedBox(height: 18.v),
                     Container(
                       width: double.infinity,
                       margin: EdgeInsets.only(right: 14.h),
                       child: Text(
                         'Turf Locator was founded with the vision of creating a seamless and informative experience for users looking to explore and enjoy turf locations. Our team of dedicated professionals is passionate about delivering accurate and up-to-date information to enhance your turf exploration journey.',
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                     SizedBox(height: 16.v),
                     Text(
                       'Our Team',
                       style: theme.textTheme.titleLarge!.copyWith(
                         color: appTheme.black900,
                       ),
                     ),
                     SizedBox(height: 18.v),
                     Container(
                       width: double.infinity,
                       margin: EdgeInsets.only(right: 14.h),
                       child: Text(
                         'Our team is made up of experts in technology, data management, and customer service. We are committed to providing you with the highest quality of service and ensuring that our application meets your needs.',
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                     SizedBox(height: 16.v),
                     Text(
                       'Our Values',
                       style: theme.textTheme.titleLarge!.copyWith(
                         color: appTheme.black900,
                       ),
                     ),
                     SizedBox(height: 18.v),
                     Container(
                       width: double.infinity,
                       margin: EdgeInsets.only(right: 14.h),
                       child: Text(
                         'Integrity: We are committed to providing accurate and honest information.\n\nInnovation: We continuously seek to improve and innovate our app to offer you the best experience.\n\nCustomer Focus: Your satisfaction is our top priority. We are here to support you and address your needs.',
                         style: theme.textTheme.bodyLarge!.copyWith(
                           color: appTheme.black900,
                           height: 1.50,
                         ),
                       ),
                     ),
                     SizedBox(height: 50,)
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



