import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/password_changed_popup_screen/password_changed_popup_screen.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
 ResetPasswordController controller = Get.put(ResetPasswordController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
      backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Column(children: [
              getCommonAppBar("lbl_reset_password".tr),
             SizedBox(height: 16.v),
             Align(
                 alignment: Alignment.centerLeft,
                 child: Container(
                     width: 365.h,
                     margin: EdgeInsets.only(left: 20.h, right: 42.h),
                     child: Text("msg_please_enter_your3".tr,
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         style: theme.textTheme.bodyLarge!
                             .copyWith(
                             color: appTheme.black900,
                             height: 1.50)))),
             SizedBox(height: 45.v),
             buildNewpassword(),
             SizedBox(height: 25.v),
             buildConfirmpassword(),
             SizedBox(height: 49.v),
             buildCreate(),
             SizedBox(height: 5.v)
            ])),
      ));
 }




 /// Section Widget
 Widget buildNewpassword() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Obx(() => CustomTextFormField(
          controller: controller.newpasswordController,
          hintText: "lbl_new_password".tr,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
              onTap: () {
               controller.isShowPassword.value =
               !controller.isShowPassword.value;
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 18.v, 18.h, 18.v),
                  child: CustomImageView(
                    color: appTheme.black900,
                      imagePath: !controller.isShowPassword.value?ImageConstant.imgIcEye:ImageConstant.imgIcEyeClose,
                      height: 20.adaptSize,
                      width: 20.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
           if (value == null ||
               value.isEmpty) {
            return "err_msg_please_enter_valid_password".tr;
           }
           return null;
          },
          obscureText: controller.isShowPassword.value,
          contentPadding:
          EdgeInsets.only(left: 16.h, top: 18.v, bottom: 18.v))));
 }

 /// Section Widget
 Widget buildConfirmpassword() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Obx(() => CustomTextFormField(
          controller: controller.confirmpasswordController,
          hintText: "msg_confirm_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
              onTap: () {
               controller.isShowPassword1.value =
               !controller.isShowPassword1.value;
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 18.v, 18.h, 18.v),
                  child: CustomImageView(
                      color: appTheme.black900,
                      imagePath: !controller.isShowPassword1.value?ImageConstant.imgIcEye:ImageConstant.imgIcEyeClose,
                      height: 20.adaptSize,
                      width: 20.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
           if (value == null ||value.isEmpty) {
            return "err_msg_please_enter_valid_password".tr;
           }
           return null;
          },
          obscureText: controller.isShowPassword1.value,
          contentPadding:
          EdgeInsets.only(left: 16.h, top: 18.v, bottom: 18.v))));
 }

 /// Section Widget
 Widget buildCreate() {
  return CustomElevatedButton(
      text: "lbl_create".tr,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      onPressed: () {
        if(_formKey.currentState!.validate()){
       onTapCreate();}
      });
 }

 /// Navigates to the verificationScreen when the action is triggered.
 onTapResetPassword() {
  Get.toNamed(
   AppRoutes.verificationScreen,
  );
 }

 /// Navigates to the passwordChangedPopupScreen when the action is triggered.
 onTapCreate() {

   showDialog(
     barrierDismissible: false,
     context: context,
     builder: (context) {
       return AlertDialog(
           insetPadding: EdgeInsets.all(16.h),
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20.h)),
           contentPadding: EdgeInsets.zero,
           content: PasswordChangedPopupScreen());
     },
   );


 }
}


