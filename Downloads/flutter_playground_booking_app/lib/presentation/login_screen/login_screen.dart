import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/core/utils/validation_functions.dart';
// import 'package:flutter_playground_booking_app/presentation/choose_role.dart/choose_role_screen.dart';
// import 'package:flutter_playground_booking_app/presentation/choose_role.dart/models/role_model.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }

  @override
Widget build(BuildContext context) {
  // return WillPopScope(
  //   onWillPop: () async {
  //     closeApp();
  //     return false;
  //   },
  //   child: Scaffold(
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
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("lbl_log_in".tr,
                      style: theme.textTheme.headlineMedium!.copyWith(color: appTheme.black900)),
                ),
                SizedBox(height: 10.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 363.h,
                    margin: EdgeInsets.only(right: 24.h),
                    child: Text("msg_please_enter_your".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: appTheme.black900,
                          height: 1.50,
                        )),
                  ),
                ),
                SizedBox(height: 45.v),
                Obx(() => Column(
                  children: [
                    CustomTextFormField(
                      borderDecoration: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: controller.emailError.value != null ? Colors.red : Colors.transparent
                        )
                      ),
                      controller: controller.emailController,
                      hintText: "lbl_email_address".tr,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || !isValidEmail(value, isRequired: true)) {
                          return "Please enter a valid email address.";
                        }
                        return null;
                      },
                      errorText: controller.emailError.value, // Bind to observable
                    ),
                    if (controller.emailError.value != null) 
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                        controller.emailError.value!,
                        style: TextStyle(color: Colors.red),textAlign: TextAlign.start,
                      ),
                      )
                  ],
                )),
                SizedBox(height: 25.v),
                Obx(() => Column(
                  children: [
                    CustomTextFormField(
                      borderDecoration: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: controller.emailError.value != null ? Colors.red : Colors.transparent
                        )
                      ),
                      controller: controller.passwordController,
                      hintText: "lbl_password".tr,
                      textInputAction: TextInputAction.done,
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
                            imagePath: !controller.isShowPassword.value
                                ? ImageConstant.imgIcEye
                                : ImageConstant.imgIcEyeClose,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(maxHeight: 56.v),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid password.";
                        }
                        return null;
                      },
                      obscureText: controller.isShowPassword.value,
                      contentPadding: EdgeInsets.only(left: 16.h, top: 18.v, bottom: 18.v),
                      errorText: controller.passwordError.value, // Bind to observable
                    ),
                    if (controller.passwordError.value != null) // Display error below field
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child: Text(
                        controller.passwordError.value!,
                        style: TextStyle(color: Colors.red),textAlign: TextAlign.start,
                      ),
                      )
                  ],
                )),
                SizedBox(height: 20.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      onTapTxtForgotPassword();
                    },
                    child: Text("msg_forgot_password".tr,
                        style: theme.textTheme.bodyLarge!.copyWith(color: appTheme.black900)),
                  ),
                ),
                SizedBox(height: 48.v),
                CustomElevatedButton(
                  text: "lbl_log_in".tr,
                  onPressed: () {
                    // controller.login();
                    if (_formKey.currentState!.validate()) {
                      PrefUtils.setIsSignIn(false);
                      controller.login(); // Call login method
                    }
                  },
                ),
                
                Spacer(),
                SizedBox(height: 11.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text("msg_don_t_have_an_account".tr,
                          style: CustomTextStyles.bodyLargeGray60001),
                    ),
                    GestureDetector(
                      onTap: () {
                        onTapTxtSignUp();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text("lbl_sign_up".tr,
                            style: CustomTextStyles.titleMediumPrimary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    // ),
  );
}



  onTapLogIn() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  onTapTxtSignUp() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}

  onTapTxtForgotPassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }