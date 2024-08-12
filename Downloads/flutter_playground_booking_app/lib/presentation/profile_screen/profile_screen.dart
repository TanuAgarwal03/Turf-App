// import 'package:flutter_playground_booking_app/presentation/rate_us_experirnce_screen/rate_us_experirnce_screen.dart';
// import '../log_out_dialogue/log_out_dialogue.dart';
// import 'controller/profile_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   ProfileController controller = Get.put(ProfileController());
//   @override
//   Widget build(BuildContext context) {

//     mediaQueryData = MediaQuery.of(context);

    
//     return Column(
//       children: [
//         buildComponentOne(),
//         SizedBox(height: 24.v),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//             padding: EdgeInsets.only(left: 20.h),
//             child: Row(
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgAvtar1,
//                   height: 80.adaptSize,
//                   width: 80.adaptSize,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: 15.h,
//                     top: 16.v,
//                     bottom: 13.v,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         controller.profileModelObj.value.firstName + controller.profileModelObj.value.lastName ,
//                         style: theme.textTheme.titleLarge!.copyWith(
//                           color: appTheme.black900,
//                         ),
//                       ),
//                       SizedBox(height: 6.v),
//                       Text(
//                         controller.profileModelObj.value.email,
//                         style: theme.textTheme.bodyLarge!.copyWith(
//                           color: appTheme.black900,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: 32.v),
//        Expanded(
//          child: ListView(
//            children: [
//              buildIcAboutUs((){
//                Get.toNamed(AppRoutes.myProfileScreen);
//              }, "lbl_my_profile".tr, ImageConstant.imgLightProfile),
//              SizedBox(height: 16.v),
//              buildIcAboutUs((){
//                Get.toNamed(AppRoutes.settingsScreen);
//              }, "lbl_settings".tr, ImageConstant.imgIcSettings),
//              SizedBox(height: 16.v),
//              buildIcAboutUs((){
//                Get.toNamed(AppRoutes.privacyPolicyScreen);
//              }, "Privacy policy".tr, ImageConstant.imgIcPrivacyPolicy),
//              SizedBox(height: 16.v),
//              buildIcAboutUs((){
//                Get.toNamed(AppRoutes.helpScreen);
//              }, "lbl_help".tr, ImageConstant.imgIcHelp),

//              SizedBox(height: 16.v),
//              buildIcAboutUs((){
//                Get.toNamed(AppRoutes.aboutUsScreen);
//              }, "lbl_about_us".tr, ImageConstant.imgIcAboutUs),
//              SizedBox(height: 16.v),
//              buildIcAboutUs((){
//                showDialog(
//                  barrierDismissible: false,
//                  context: context,
//                  builder: (context) {
//                    return AlertDialog(
//                        insetPadding: EdgeInsets.all(16),
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(20)),
//                        contentPadding: EdgeInsets.zero,
//                        content: RateUsExperirnceScreen());
//                  },
//                );
//              }, "lbl_rate_us".tr, ImageConstant.imgStar120x20),
//              SizedBox(height: 16.v),
//              buildIcAboutUs((){
//                Get.toNamed(AppRoutes.myGroundsScreen);
//              }, "lbl_my_grounds".tr, ImageConstant.imgIcImage),
//              SizedBox(height: 16.v),
//              Center(
//                child: GestureDetector(
//                    onTap: () {
//                      showDialog(
//                        barrierDismissible: false,
//                        context: context,
//                        builder: (context) {
//                          return AlertDialog(
//                              insetPadding: EdgeInsets.all(16),
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.circular(20)),
//                              contentPadding: EdgeInsets.zero,
//                              content: LogOutDialogue());
//                        },
//                      );
//                    },
//                    child: Padding(
//                        padding: EdgeInsets.only(left: 4.h),
//                        child: Text("Logout",
//                            style: CustomTextStyles
//                                .titleMediumPrimary700))),
//              ),
//              SizedBox(height: 16.v),
//            ],
//          ),
//        )
//       ],
//     );
//   }

//   Widget buildComponentOne() {
//     return Container(
//       width: double.maxFinite,
//       padding: EdgeInsets.symmetric(
//         horizontal: 20.h,
//         vertical: 17.v,
//       ),
//       decoration: AppDecoration.white.copyWith(
//         color: appTheme.bgColor,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 8.v),
//           Text(
//             "lbl_profile".tr,
//             style: theme.textTheme.headlineMedium!.copyWith(
//               color: appTheme.black900,
//             ),
//           ),
//         ],
//       ),
//     );
//   }




//   /// Common widget
//   Widget buildIcAboutUs(onTap,title,icon) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.h),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           padding: EdgeInsets.all(8.h),
//           decoration: AppDecoration.fillGray.copyWith(
//             color: appTheme.textfieldFillColor,
//             borderRadius: BorderRadiusStyle.roundedBorder16,
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 height: 48.adaptSize,
//                 width: 48.adaptSize,
//                 padding: EdgeInsets.all(12.h),
//                 decoration: AppDecoration.white.copyWith(
//                   color: PrefUtils().getThemeData() == "primary"?appTheme.whiteA700:appTheme.lightgraynightMode,
//                   borderRadius: BorderRadiusStyle.circleBorder24,
//                 ),
//                 child: CustomImageView(
//                   color: appTheme.black900,
//                   imagePath: icon,
//                   height: 24.adaptSize,
//                   width: 24.adaptSize,
//                   alignment: Alignment.center,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 16.h,
//                   top: 14.v,
//                   bottom: 13.v,
//                 ),
//                 child: Text(
//                   title,
//                   style: theme.textTheme.bodyLarge!.copyWith(
//                     color: appTheme.black900,
//                   ),
//                 ),
//               ),
//               Spacer(),
//               CustomImageView(
//                 color: appTheme.black900,
//                 imagePath: ImageConstant.imgIcNextOnerrorcontainer,
//                 height: 20.adaptSize,
//                 width: 20.adaptSize,
//                 margin: EdgeInsets.only(
//                   top: 14.v,
//                   right: 8.h,
//                   bottom: 13.v,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter_playground_booking_app/presentation/rate_us_experirnce_screen/rate_us_experirnce_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../log_out_dialogue/log_out_dialogue.dart';
import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return FutureBuilder(
      future: controller.fetchUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: LoadingAnimationWidget.prograssiveDots(color:const Color.fromARGB(255, 86, 141, 107) , size: 50));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading profile data'));
        } else {
          return Column(
            children: [
              buildComponentOne(),
              SizedBox(height: 24.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgAvtar1,
                        height: 80.adaptSize,
                        width: 80.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.h,
                          top: 16.v,
                          bottom: 13.v,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${controller.profileModelObj.value.firstName} ${controller.profileModelObj.value.lastName}',
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: appTheme.black900,
                              ),
                            ),
                            SizedBox(height: 6.v),
                            Text(
                              controller.profileModelObj.value.email,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: appTheme.black900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.v),
              Expanded(
                child: ListView(
                  children: [
                    buildIcAboutUs(() {
                      Get.toNamed(AppRoutes.myProfileScreen);
                    }, "lbl_my_profile".tr, ImageConstant.imgLightProfile),
                    SizedBox(height: 16.v),
                    buildIcAboutUs(() {
                      Get.toNamed(AppRoutes.settingsScreen);
                    }, "lbl_settings".tr, ImageConstant.imgIcSettings),
                    SizedBox(height: 16.v),
                    buildIcAboutUs(() {
                      Get.toNamed(AppRoutes.privacyPolicyScreen);
                    }, "Privacy policy".tr, ImageConstant.imgIcPrivacyPolicy),
                    SizedBox(height: 16.v),
                    buildIcAboutUs(() {
                      Get.toNamed(AppRoutes.helpScreen);
                    }, "lbl_help".tr, ImageConstant.imgIcHelp),
                    SizedBox(height: 16.v),
                    buildIcAboutUs(() {
                      Get.toNamed(AppRoutes.aboutUsScreen);
                    }, "lbl_about_us".tr, ImageConstant.imgIcAboutUs),
                    SizedBox(height: 16.v),
                    buildIcAboutUs(() {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              insetPadding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: EdgeInsets.zero,
                              content: RateUsExperirnceScreen());
                        },
                      );
                    }, "lbl_rate_us".tr, ImageConstant.imgStar120x20),
                    SizedBox(height: 16.v),
                    buildIcAboutUs(() {
                      Get.toNamed(AppRoutes.myGroundsScreen);
                    }, "lbl_my_grounds".tr, ImageConstant.imgIcImage),
                    SizedBox(height: 16.v),
                    Center(
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    insetPadding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    contentPadding: EdgeInsets.zero,
                                    content: LogOutDialogue());
                              },
                            );
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Text("Logout",
                                  style: CustomTextStyles.titleMediumPrimary700))),
                    ),
                    SizedBox(height: 16.v),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget buildComponentOne() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.white.copyWith(
        color: appTheme.bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.v),
          Text(
            "lbl_profile".tr,
            style: theme.textTheme.headlineMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIcAboutUs(onTap, title, icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8.h),
          decoration: AppDecoration.fillGray.copyWith(
            color: appTheme.textfieldFillColor,
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 48.adaptSize,
                width: 48.adaptSize,
                padding: EdgeInsets.all(12.h),
                decoration: AppDecoration.white.copyWith(
                  color: PrefUtils().getThemeData() == "primary"
                      ? appTheme.whiteA700
                      : appTheme.lightgraynightMode,
                  borderRadius: BorderRadiusStyle.circleBorder24,
                ),
                child: CustomImageView(
                  color: appTheme.black900,
                  imagePath: icon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 14.v,
                  bottom: 13.v,
                ),
                child: Text(
                  title,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
              Spacer(),
              CustomImageView(
                color: appTheme.black900,
                imagePath: ImageConstant.imgIcNextOnerrorcontainer,
                height: 20.adaptSize,
                width: 20.adaptSize,
                margin: EdgeInsets.only(
                  top: 14.v,
                  right: 8.h,
                  bottom: 13.v,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

