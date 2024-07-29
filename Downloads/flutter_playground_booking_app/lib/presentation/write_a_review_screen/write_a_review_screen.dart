import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'controller/write_a_review_controller.dart';



class WriteAReviewScreen extends StatefulWidget {
  const WriteAReviewScreen({super.key});

  @override
  State<WriteAReviewScreen> createState() => _WriteAReviewScreenState();
}

class _WriteAReviewScreenState extends State<WriteAReviewScreen> {
 WriteAReviewController controller = Get.put(WriteAReviewController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
   backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
             getCommonAppBar("lbl_write_a_review".tr),
             SizedBox(height: 16.v),
             Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20.h),
                 child: CustomTextFormField(
                     controller: controller.group1171274964Controller,
                     hintText: "msg_write_your_review".tr,
                     hintStyle: CustomTextStyles.bodyLargeGray60001,
                     textInputAction: TextInputAction.done,
                     maxLines: 7)),
             SizedBox(height: 5.v)
            ])),
      ),
      bottomNavigationBar: _buildButtons());
 }



 /// Section Widget
 Widget _buildButtons() {
  return Container(
   width: double.infinity,
      decoration: AppDecoration.white.copyWith(
       color: appTheme.bgColor
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 20.h,right: 20.h,top: 16.v,bottom: 32.v),
        child: CustomElevatedButton(
            text: "lbl_submit_review".tr,
            onPressed: () {
            Get.back();
            }),
      ));
 }

 /// Navigates to the reviewScreen when the action is triggered.
 onTapWriteAReview() {
  Get.toNamed(
   AppRoutes.reviewScreen,
  );
 }

 /// Navigates to the reviewScreen when the action is triggered.
 onTapSubmitReview() {
  Get.toNamed(
   AppRoutes.reviewScreen,
  );
 }
}






