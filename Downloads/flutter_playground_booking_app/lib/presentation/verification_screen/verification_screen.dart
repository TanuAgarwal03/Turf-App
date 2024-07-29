import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';
import 'controller/verification_controller.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
 VerificationController controller = Get.put(VerificationController());
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
           getCommonAppBar("lbl_verification".tr),
          SizedBox(height: 16.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  width: 244.h,
                  margin: EdgeInsets.only(left: 19.h),
                  child: RichText(
                      text: TextSpan(children: [
                       TextSpan(
                           text: "msg_please_enter_the2".tr,
                           style: theme.textTheme.bodyLarge!.copyWith(
                             color: appTheme.black900,
                           )),
                       TextSpan(
                           text: "msg_johnabram_gmail_com".tr,
                           style: CustomTextStyles.bodyLargePrimary)
                      ]),
                      textAlign: TextAlign.left))),
          SizedBox(height: 45.v),
          Padding(
              padding: EdgeInsets.only(left: 20.h, right: 23.h),
              child: Obx(() => Pinput(

                errorTextStyle:  TextStyle(
                  color:appTheme.errorColor,
                  fontSize: 14.fSize,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                ),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                disabledPinTheme: PinTheme(

                    padding: EdgeInsets.only(left: 8.5.h,right: 8.5.h),
                    decoration: BoxDecoration(color: Colors.red)
                ),
                controller: controller.otpController.value,
                length: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter valid OTP";
                  }
                  return null;
                },
                errorPinTheme: PinTheme(
                  padding: EdgeInsets.only(left: 8.65.h,right: 8.5.h),
                  decoration: BoxDecoration(
                    border: Border.all(color:appTheme.red700),
                    color:appTheme.textfieldFillColor,
                    borderRadius:  BorderRadius.circular(
                      12.h,),
                  ),
                  textStyle: CustomTextStyles.bodyLargeGray600.copyWith(
                    color: appTheme.red700,
                  ),
                  width: 50.h,
                  height: 50.h,
                ),
                defaultPinTheme: PinTheme(
                  padding: EdgeInsets.only(left: 8.5.h,right: 8.5.h),
                  width: 50.h,
                  height: 50.h,
                  textStyle:TextStyle(
                    color: appTheme.black900,
                    fontSize: 24.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: BoxDecoration(
                    color:appTheme.textfieldFillColor,
                    borderRadius:  BorderRadius.circular(
                      12.h,),

                  ),
                ),
              ),)),
          SizedBox(height: 50.v),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
           Padding(
               padding: EdgeInsets.only(top: 1.v),
               child: Text("msg_didn_t_get_code".tr,
                   style: CustomTextStyles.bodyLargeGray60001)),
           Padding(
               padding: EdgeInsets.only(left: 4.h),
               child: Text("lbl_resend_code".tr,
                   style: CustomTextStyles.titleMediumPrimary))
          ]),
          SizedBox(height: 48.v),
          CustomElevatedButton(
              text: "lbl_verify".tr,
              margin: EdgeInsets.only(left: 22.h, right: 18.h),
              onPressed: () {
                if(_formKey.currentState!.validate()){
               onTapVerify();}
              }),
          SizedBox(height: 5.v)
         ]),
       ),
      ));
 }



 /// Navigates to the forgotPasswordScreen when the action is triggered.
 onTapVerification() {
  Get.toNamed(
   AppRoutes.forgotPasswordScreen,
  );
 }

 /// Navigates to the resetPasswordScreen when the action is triggered.
 onTapVerify() {
  Get.toNamed(
   AppRoutes.resetPasswordScreen,
  );
 }
}




