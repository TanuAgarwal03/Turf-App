import 'controller/privacy_policy_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';




class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  PrivacyPolicyController privacyPolicyController =
      Get.put(PrivacyPolicyController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCommonAppBar("lbl_privacy_policy".tr),
              SizedBox(height: 16.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  "msg_types_of_data_we".tr,
                  style: CustomTextStyles.titleLarge22,
                ),
              ),
              SizedBox(height: 11.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 12.h),
                  child: Text(
                    "msg_torem_ipsum_dolor".tr,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: appTheme.black900,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  "msg_use_of_your_personal".tr,
                  style: CustomTextStyles.titleLarge22,
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 12.h),
                  child: Text(
                    "msg_torem_ipsum_dolor".tr,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: appTheme.black900,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  "msg_disclosure_of_your".tr,
                  style: CustomTextStyles.titleLarge22,
                ),
              ),
              SizedBox(height: 14.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "msg_lorem_ipsum_dolor".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: appTheme.black900,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }


}




