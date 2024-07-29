// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/core/utils/validation_functions.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'controller/add_ground_controller.dart';





class AddGroundScreen extends StatefulWidget {
  const AddGroundScreen({super.key});

  @override
  State<AddGroundScreen> createState() => _AddGroundScreenState();
}

class _AddGroundScreenState extends State<AddGroundScreen> {
 AddGroundController controller = Get.put(AddGroundController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: Container(
                  width: double.maxFinite,
                  child: Column(children: [
                   getCommonAppBar("lbl_add_ground".tr),
                   SizedBox(height: 25.v),
                   _buildMasterInput(),SizedBox(height: 25.v),
                   _buildEmail(),
                   SizedBox(height: 25.v),
                   _buildMasterInput1(),
                   SizedBox(height: 25.v),
                   _buildMasterInput2(),
                   SizedBox(height: 25.v),
                   _buildMasterInput3(),
                   SizedBox(height: 5.v)
                  ]))),
        ),
        bottomNavigationBar: _buildButtons()),
  );
 }



 /// Section Widget
 Widget _buildMasterInput() {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 20.h),
    child: CustomTextFormField(
        controller: controller.masterInputController,
        hintText: "Name"),
  );
 }

 /// Section Widget
 Widget _buildEmail() {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 20.h),
    child: CustomTextFormField(
        controller: controller.emailController,
        hintText: "Email address",
        textInputType: TextInputType.emailAddress,
        validator: (value) {
         if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "err_msg_please_enter_valid_email".tr;
         }
         return null;
        }),
  );
 }

 /// Section Widget
 Widget _buildMasterInput1() {
  return Padding(
   padding:  EdgeInsets.symmetric(horizontal: 20.h),
    child: CustomTextFormField(
        controller: controller.masterInputController1,
        hintText: "Phone number."),
  );
 }

 /// Section Widget
 Widget _buildMasterInput2() {
  return Padding(
   padding:  EdgeInsets.symmetric(horizontal: 20.h),
    child: CustomTextFormField(
        controller: controller.masterInputController2,
        hintText: "Ground"),
  );
 }

 /// Section Widget
 Widget _buildMasterInput3() {
  return Padding(
   padding:  EdgeInsets.symmetric(horizontal: 20.h),
    child: CustomTextFormField(
        controller: controller.masterInputController3,
        hintText: "Location",
        textInputAction: TextInputAction.done),
  );
 }

 /// Section Widget
 Widget _buildContinue() {
  return Padding(
    padding:  EdgeInsets.only(left: 20.h,right: 20.h, bottom: 32.v,top: 16.v),
    child: CustomElevatedButton(
        text: "lbl_continue".tr,
        onPressed: () {
         onTapContinue();
        }),
  );
 }

 /// Section Widget
 Widget _buildButtons() {
  return Container(
     width: double.infinity,
     color: appTheme.bgColor,
      child: _buildContinue());
 }

 /// Navigates to the groundCategoryScreen when the action is triggered.
 onTapContinue() {
  Get.toNamed(
   AppRoutes.groundCategoryScreen,
  );
 }
}



