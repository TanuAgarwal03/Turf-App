// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/core/utils/validation_functions.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());
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
          backgroundColor: appTheme.bgColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      getCommonAppBar("msg_forgot_password".tr),
                      SizedBox(height: 16.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: 343.h,
                              margin: EdgeInsets.only(left: 20.h, right: 64.h),
                              child: Text("msg_please_enter_your2".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(
                                      color:appTheme.black900,
                                      height: 1.50)))),
                      SizedBox(height: 45.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: CustomTextFormField(
                              controller: controller.emailController,
                              hintText: "lbl_email_address".tr,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email address.";
                                }
                                return null;
                              })),
                      SizedBox(height: 49.v),
                      CustomElevatedButton(
                          text: "lbl_continue".tr,
                          margin: EdgeInsets.symmetric(horizontal: 20.h),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Get.toNamed(
                                AppRoutes.verificationScreen,
                              );
                            }
                          }),
                      SizedBox(height: 5.v)
                    ]))),
          )),
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapForgotPassword() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the verificationScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.verificationScreen,
    );
  }
}
