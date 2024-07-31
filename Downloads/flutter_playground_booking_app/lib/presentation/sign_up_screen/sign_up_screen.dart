// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';
// import 'package:flutter_playground_booking_app/core/utils/validation_functions.dart';
// import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
// import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
// import 'controller/sign_up_controller.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//  SignUpController controller = Get.put(SignUpController());
//  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  @override
//  Widget build(BuildContext context) {
//   mediaQueryData = MediaQuery.of(context);
//   return Scaffold(
//     backgroundColor: appTheme.bgColor,
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Form(
//             key: _formKey,
//             child: Container(
//                 width: double.maxFinite,
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 20.h, vertical: 36.v),
//                 child: Column(children: [
//                  Align(
//                      alignment: Alignment.centerLeft,
//                      child: Text("lbl_sign_up".tr,
//                          style: theme.textTheme.headlineMedium!.copyWith(
//                              color:appTheme.black900
//                          ))),
//                  SizedBox(height: 10.v),
//                  Align(
//                      alignment: Alignment.centerLeft,
//                      child: Container(
//                          width: 363.h,
//                          margin: EdgeInsets.only(right: 24.h),
//                          child: Text("msg_please_enter_your".tr,
//                              maxLines: 2,
//                              overflow: TextOverflow.ellipsis,
//                              style: theme.textTheme.bodyLarge!
//                                  .copyWith(
//                                  color:appTheme.black900,
//                                  height: 1.50)))),
//                  SizedBox(height: 45.v),
//                  buildFirstName(),
//                  SizedBox(height: 25.v),
//                  buildLastName(),
//                  SizedBox(height: 25.v),
//                  buildEmail(),
//                  SizedBox(height: 25.v),
//                  buildPassword(),
//                  SizedBox(height: 49.v),
//                  buildSignUp(),
//                  Spacer(),
//                  SizedBox(height: 11.v),
//                  Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                       Text("msg_already_have_an".tr,
//                           style: CustomTextStyles.bodyLargeGray60001),
//                       GestureDetector(
//                           onTap: () {
//                            Get.back();
//                           },
//                           child: Padding(
//                               padding: EdgeInsets.only(left: 4.h),
//                               child: Text("lbl_log_in".tr,
//                                   style: CustomTextStyles
//                                       .titleMediumPrimary)))
//                      ])
//                 ]))),
//       ));
//  }

//  /// Section Widget
//  Widget buildFirstName() {
//   return CustomTextFormField(
//       controller: controller.firstNameController,
//       hintText: "lbl_first_name".tr,
//       validator: (value) {
//        if (!isText(value) || value!.isEmpty) {
//         return "err_msg_please_enter_valid_text".tr;
//        }
//        return null;
//       });
//  }

//  /// Section Widget
//  Widget buildLastName() {
//   return CustomTextFormField(
//       controller: controller.lastNameController,
//       hintText: "lbl_last_name".tr,
//       validator: (value) {
//        if (!isText(value) || value!.isEmpty) {
//         return "err_msg_please_enter_valid_text".tr;
//        }
//        return null;
//       });
//  }

//  /// Section Widget
//  Widget buildEmail() {
//   return CustomTextFormField(
//       controller: controller.emailController,
//       hintText: "lbl_email_address".tr,
//       textInputType: TextInputType.emailAddress,
//       validator: (value) {
//        if (value == null || (!isValidEmail(value, isRequired: true))) {
//         return "err_msg_please_enter_valid_email".tr;
//        }
//        return null;
//       });
//  }

//  /// Section Widget
//  Widget buildPassword() {
//   return Obx(() => CustomTextFormField(
//       controller: controller.passwordController,
//       hintText: "lbl_password".tr,
//       textInputAction: TextInputAction.done,
//       textInputType: TextInputType.visiblePassword,
//       suffix: InkWell(
//           onTap: () {
//            controller.isShowPassword.value =
//            !controller.isShowPassword.value;
//           },
//           child: Container(
//               margin: EdgeInsets.fromLTRB(30.h, 18.v, 18.h, 18.v),
//               child: CustomImageView(
//                   color:appTheme.black900,
//                   imagePath: !controller.isShowPassword.value?ImageConstant.imgIcEye:ImageConstant.imgIcEyeClose,
//                   height: 20.adaptSize,
//                   width: 20.adaptSize))),
//       suffixConstraints: BoxConstraints(maxHeight: 56.v),
//       validator: (value) {
//        if (value == null || (!isValidPassword(value, isRequired: true))) {
//         return "err_msg_please_enter_valid_password".tr;
//        }
//        return null;
//       },
//       obscureText: controller.isShowPassword.value,
//       contentPadding: EdgeInsets.only(left: 16.h, top: 18.v, bottom: 18.v)));
//  }

//  /// Section Widget
//  Widget buildSignUp() {
//   return CustomElevatedButton(
//       text: "lbl_sign_up".tr,
//       onPressed: () {
//        if(_formKey.currentState!.validate()){
//        onTapSignUp();}
//       });
//  }

//  /// Navigates to the homeContainerScreen when the action is triggered.
//  onTapSignUp() {
//  Get.back();
//  }

//  /// Navigates to the loginScreen when the action is triggered.
//  onTapTxtLogIn() {
//   Get.toNamed(
//    AppRoutes.loginScreen,
//   );
//  }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/core/utils/validation_functions.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = Get.put(SignUpController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _selectedRole = 'User';
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 36.v),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_sign_up".tr,
                    style: theme.textTheme.headlineMedium!.copyWith(color: appTheme.black900),
                  ),
                ),
                SizedBox(height: 10.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 363.h,
                    margin: EdgeInsets.only(right: 24.h),
                    child: Text(
                      "msg_please_enter_your".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: appTheme.black900,
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45.v),
                buildFirstName(),
                SizedBox(height: 25.v),
                buildLastName(),
                SizedBox(height: 25.v),
                buildEmail(),
                SizedBox(height: 25.v),
                buildPassword(),
            //     SizedBox(height: 30.v),
            //     Text('Choose your role :'),
            //     Row(
            //   children: [
            //     Expanded(
            //       child: RadioListTile<String>(
            //         title: Text('Owner'),
            //         value: 'Owner',
            //         groupValue: _selectedRole,
            //         onChanged: (String? value) {
            //           setState(() {
            //             _selectedRole = value!;
            //           });
            //         },
            //       ),
            //     ),
            //     Expanded(
            //       child: RadioListTile<String>(
            //         title: Text('User'),
            //         value: 'User',
            //         groupValue: _selectedRole,
            //         onChanged: (String? value) {
            //           setState(() {
            //             _selectedRole = value!;
            //           });
            //         },
            //       ),
            //     ),
            //   ],
            // ),
                SizedBox(height: 49.v),
                
                
                buildSignUp(),
                Obx(() {
                  if (controller.errorMessage.value != null) {
                    return Text(
                      controller.errorMessage.value!,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                }),
                Spacer(),
                SizedBox(height: 11.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "msg_already_have_an".tr,
                      style: CustomTextStyles.bodyLargeGray60001,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          "lbl_log_in".tr,
                          style: CustomTextStyles.titleMediumPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget buildFirstName() {
    return CustomTextFormField(
      controller: controller.firstNameController,
      hintText: "lbl_first_name".tr,
      validator: (value) {
        if (!isText(value) || value!.isEmpty) {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget buildLastName() {
    return CustomTextFormField(
      controller: controller.lastNameController,
      hintText: "lbl_last_name".tr,
      validator: (value) {
        if (!isText(value) || value!.isEmpty) {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget buildEmail() {
    return CustomTextFormField(
      controller: controller.emailController,
      hintText: "lbl_email_address".tr,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "err_msg_please_enter_valid_email".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget buildPassword() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.passwordController,
        hintText: "lbl_password".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        suffix: InkWell(
          onTap: () {
            controller.isShowPassword.value = !controller.isShowPassword.value;
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(30.h, 18.v, 18.h, 18.v),
            child: CustomImageView(
              color: appTheme.black900,
              imagePath: !controller.isShowPassword.value ? ImageConstant.imgIcEye : ImageConstant.imgIcEyeClose,
              height: 20.adaptSize,
              width: 20.adaptSize,
            ),
          ),
        ),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            // return "err_msg_please_enter_valid_password".tr;
            return "Password must contain atleast an uppercase letter,a lowercase letter \n,a digit,a special character ans should be at least 8 characters long.";
          }
          return null;
        },
        obscureText: controller.isShowPassword.value,
        contentPadding: EdgeInsets.only(left: 16.h, top: 18.v, bottom: 18.v),
      ),
    );
  }

  /// Section Widget
  Widget buildSignUp() {
    return CustomElevatedButton(
      text: "lbl_sign_up".tr,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          onTapSignUp();
          Get.back();
        }
      },
    );
  }

  /// Calls the registerUser method from the controller.
  void onTapSignUp() {
    controller.registerUser();
  }
}






// Ultra
// Power
// ultrapower@gmail.com
// Ultrapower@123

//Aakansha
//Agarwal
//agarwalaakansha01@gmail.com
//Aakansha@1103