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
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCommonAppBar("lbl_privacy_policy".tr),
              SizedBox(height: 16.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  'Introduction',
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
                    'Welcome to Turf Locators. We are committed to protecting your privacy and ensuring that your personal information is handled in a safe and responsible manner. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our application to view turf locations and their details.',
                    // maxLines: 4,
                    // overflow: TextOverflow.ellipsis,
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
                  '1. Information We Collect',
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
                    'Personal Information: Information that identifies you personally, such as your name, email address, and contact details, which you provide when you create an account or contact us. \nUsage Data: Information about your interactions with the app, such as your IP address, device type, browser type, operating system, and usage patterns. This data helps us understand how our app is used and improve its functionality.\nLocation Data: Information about your geographic location if you enable location services on your device. This helps us provide you with relevant turf locations near you.\nContent Data: Information related to the turf details you view or interact with, including images, descriptions, and user reviews.',
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
                  '2. How We Use Your Information',
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
                    'We use the collected information for various purposes, including:\nTo provide and maintain our app and its features.\nTo improve and personalize your experience with our app.\nTo respond to your inquiries, comments, and support requests.\nTo send you updates, newsletters, and promotional materials related to our app (if you have opted in to receive such communications).\nTo analyze usage patterns and improve our app\'s performance and functionality.\nTo comply with legal obligations and resolve any disputes.',
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
                  '3. How We Share Your Information',
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
                    'We do not sell, trade, or otherwise transfer your personal information to outside parties except in the following circumstances:\nService Providers: We may share your information with third-party service providers who assist us in operating our app, conducting business, or providing services on our behalf, subject to confidentiality agreements.\nLegal Requirements: We may disclose your information if required by law, regulation, or legal process, or to protect our rights, privacy, safety, or property.\nBusiness Transfers: In the event of a merger, acquisition, or sale of assets, we may transfer your information to the successor entity.',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: appTheme.black900,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              SizedBox(height: 16.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  '4. Data Security',
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
                    'We implement reasonable security measures to protect your information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure, so we cannot guarantee absolute security.',
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
                  "5. Children's Privacy",
                  style: CustomTextStyles.titleLarge22,
                ),
              ),
              SizedBox(height: 14.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    'Our app is not intended for children under the age of 13. We do not knowingly collect or solicit personal information from children under 13. If we become aware that we have collected personal information from a child under 13, we will take steps to delete such information.',
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
                  "6. Changes to this privacy policy",
                  style: CustomTextStyles.titleLarge22,
                ),
              ),
              SizedBox(height: 14.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the updated policy on our app and updating the "Last Updated" date. Your continued use of the app after any changes constitutes your acceptance of the revised policy.',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: appTheme.black900,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100.v),
            ],
          ),
          )
        ),
      ),
    );
  }
}




