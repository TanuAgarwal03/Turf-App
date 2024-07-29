// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/core/utils/validation_functions.dart';
import 'package:flutter_playground_booking_app/widgets/custom_dropdown_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'controller/add_new_card_controller.dart';




class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
 AddNewCardController controller = Get.put(AddNewCardController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
    onWillPop: ()async {
      Get.back();
      return true;
    },
    child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: Column(children: [
              getCommonAppBar("lbl_add_new_card".tr),
               SizedBox(height: 24.v),
               _buildSelectCardType(),
               SizedBox(height: 24.v),
               buildName(),
               SizedBox(height: 24.v),
               buildCardNumber(),
               SizedBox(height: 24.v),
               buildFrame(),
               SizedBox(height: 5.v)
              ])),
        ),
        bottomNavigationBar: buildButtons()),
  );
 }



 /// Section Widget
 Widget _buildSelectCardType() {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 20.h),
    child: CustomDropDown(
        focusNode: FocusNode(),
        autofocus: true,
        icon: Container(
            margin: EdgeInsets.only(left: 30.h, right: 16.h),
            child: CustomImageView(
              color: appTheme.black900,
                imagePath: ImageConstant.imgarrowDown)),
        hintText: "msg_select_card_type".tr,
        margin:  EdgeInsets.only(left: 1.h, top: 15.v),
        items: controller.addCarDetailsOneModelObj
            .value.dropdownItemList.value,
        onChanged: (value) {
          controller.onSelected(value);
        }),
  );
 }

 /// Section Widget
 Widget buildName() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
          controller: controller.nameController,

          hintText: "msg_enter_card_holder".tr,
          validator: (value) {
           if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
           }
           return null;
          }));
 }

 /// Section Widget
 Widget buildCardNumber() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
          controller: controller.cardNumberController,
          hintText: "msg_enter_card_number".tr,
          textInputType: TextInputType.number,
          validator: (value) {
           if (!isNumeric(value)) {
            return "err_msg_please_enter_valid_number".tr;
           }
           return null;
          }));
 }

 /// Section Widget
 Widget buildDate() {
  return CustomTextFormField(
      textInputType: TextInputType.datetime,
      width: 186.h,
      controller: controller.dateController,
      hintText: "lbl_expiray_date".tr);
 }

 /// Section Widget
 Widget buildCvv() {
  return Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: CustomTextFormField(
          width: 186.h,
          controller: controller.cvvController,
          hintText: "lbl_cvv".tr,
          textInputAction: TextInputAction.done));
 }

 /// Section Widget
 Widget buildFrame() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildDate(), buildCvv()]));
 }

 /// Section Widget
 Widget buildAdd() {
  return Container(
   width: double.infinity,
    color: appTheme.bgColor,
    child: Padding(
      padding: EdgeInsets.only(left: 20.h,right:20.h,top:16.v,bottom: 32.v),
      child: CustomElevatedButton(
          text: "lbl_add".tr,
          onPressed: () {
         Get.back();
          }),
    ),
  );
 }

 /// Section Widget
 Widget buildButtons() {
  return buildAdd();
 }

 /// Navigates to the paymentScreen when the action is triggered.
 onTapAddNewCard() {
  Get.toNamed(
   AppRoutes.paymentScreen,
  );
 }

 /// Navigates to the paymentScreen when the action is triggered.
 onTapAdd() {
 Get.back();
 }
}




