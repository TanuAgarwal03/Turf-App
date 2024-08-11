// ignore_for_file: deprecated_member_use

import '../../core/expantiontile/src/types/expansion_tile_border_item.dart';
import 'controller/help_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';



class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  HelpController helpController = Get.put(HelpController());
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
          child: Column(
            children: [
              getCommonAppBar("lbl_help".tr),
              SizedBox(height: 0.v),
              Expanded(
                child: ListView(
                  children: [
                    _buildFrame(
                      whatIsPlayground:'How do I create an account?',
                    ),
                    SizedBox(height: 16.v),
                    _buildFrame(
                      whatIsPlayground: 'How do I view details about a turf location?',
                    ),
                    SizedBox(height: 16.v),
                    _buildFrame(
                      whatIsPlayground: 'How do I update my profile information?',
                    ),
                    SizedBox(height: 16.v),
                    _buildFrame(
                      whatIsPlayground: 'I\’m having trouble logging in. What should I do?',
                    ),
                    SizedBox(height: 16.v),
                    _buildFrame(
                      whatIsPlayground: 'The app isn\’t working properly. How can I fix it?',
                    ),
                    // SizedBox(height: 16.v),
                    // _buildFrame(
                    //   whatIsPlayground: "msg_why_do_kids_play".tr,
                    // ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildFrame({required String whatIsPlayground}) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: ExpansionTileBorderItem(
        // collapsedIconColor: appTheme.black900,
        iconColor:appTheme.black900,
        childrenPadding:EdgeInsets.only(left: 20.h,right: 20.h,top: 0,bottom: 16.v),
        borderRadius: BorderRadius.circular(16.h),
        decoration: AppDecoration.fillGray.copyWith(
          color: appTheme.textfieldFillColor,
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: whatIsPlayground,
                  style: theme
                      .textTheme.titleMedium!.copyWith(
                    color: appTheme.black900,
                  )),
            ]),
            textAlign: TextAlign.left),
        expendedBorderColor: Colors.blue,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: double.infinity,
                child: Text(
                    'To create an account, open the app and click on the "Sign Up" button. Enter your details, such as your name, email address, and password, then follow the prompts to complete the registration process. \nTap on any turf location from the search results or map to view its details. This will include information such as images, descriptions, address, and user reviews. \nGo to your profile settings by tapping on the "Profile" icon. From there, you can update your personal information, including your name, email address, and password. \nCheck that you are using the correct email address and password. If you’ve forgotten your password, use the "Forgot Password" link on the login screen to reset it.\nTry restarting the app or reinstalling it. If the issue persists, please contact our support team about the problem.',
                    // maxLines: 3,
                    overflow:
                    TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: theme
                        .textTheme.bodyLarge!.copyWith(
                      color: appTheme.black900,
                    ))),
          )
        ],
      ),
    );




  }
}




