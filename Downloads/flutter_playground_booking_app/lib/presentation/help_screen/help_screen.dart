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
                      whatIsPlayground: "msg_what_is_called_playground".tr,
                    ),
                    SizedBox(height: 16.v),
                    _buildFrame(
                      whatIsPlayground: "msg_what_is_a_playing".tr,
                    ),
                    SizedBox(height: 16.v),
                    _buildFrame(
                      whatIsPlayground: "msg_what_is_playground".tr,
                    ),
                    SizedBox(height: 16.v),
                    _buildFrame(
                      whatIsPlayground: "msg_what_type_of_play".tr,
                    ),
                    SizedBox(height: 16.v),
                    _buildFrame(
                      whatIsPlayground: "msg_what_is_playground2".tr,
                    ),
                    SizedBox(height: 16.v),
                    _buildFrame(
                      whatIsPlayground: "msg_why_do_kids_play".tr,
                    ),
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
                    "msg_lorem_ipsum_dolor2"
                        .tr,
                    maxLines: 3,
                    overflow:
                    TextOverflow.ellipsis,
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




