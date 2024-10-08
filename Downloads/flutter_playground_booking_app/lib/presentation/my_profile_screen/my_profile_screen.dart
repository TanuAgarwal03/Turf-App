
// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';
// import 'controller/my_profile_controller.dart';

// class MyProfileScreen extends StatefulWidget {
//   const MyProfileScreen({super.key});

//   @override
//   State<MyProfileScreen> createState() => _MyProfileScreenState();
// }

// class _MyProfileScreenState extends State<MyProfileScreen> {
//   MyProfileController controller = Get.put(MyProfileController());

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     // ignore: deprecated_member_use
//     return WillPopScope(
//       onWillPop: () async {
//         Get.back();
//         return true;
//       },
//       child: Scaffold(
//         backgroundColor: appTheme.bgColor,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 getCommonAppBar(
//                   "lbl_my_profile".tr,
//                   actionwidget: Padding(
//                     padding: EdgeInsets.only(right: 20.h),
//                     child: InkWell(
//                       onTap: onTapMyProfile,
//                       child: CustomImageView(
//                         color: appTheme.black900,
//                         imagePath: ImageConstant.imgIcEdit,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                         margin: EdgeInsets.only(top: 2.v, bottom: 10.v),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 24.v),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 20.h),
//                     child: Row(
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgAvtar1,
//                           height: 80.adaptSize,
//                           width: 80.adaptSize,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 9.v),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Obx(() => Row(
//                                 children: [
//                                   Text(
//                                         controller.myProfileModelObj.value.firstName,
//                                         style: theme.textTheme.titleLarge!.copyWith(
//                                           color: appTheme.black900,
//                                         ),
//                                       ),
//                                       SizedBox(width: 4.0,),
//                                       Text(
//                                         controller.myProfileModelObj.value.lastName,
//                                         style: theme.textTheme.titleLarge!.copyWith(
//                                           color: appTheme.black900,
//                                         ),
//                                       ),
//                                 ],
//                               )),
//                               SizedBox(height: 14.v),
//                               Obx(() => Text(
//                                     controller.myProfileModelObj.value.email,
//                                     style: theme.textTheme.bodyLarge!.copyWith(
//                                       color: appTheme.black900,
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 32.v),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: Obx(() => _buildLastName(
//                       lastName: "lbl_first_name".tr, abram: controller.myProfileModelObj.value.firstName)),
//                 ),
//                 SizedBox(height: 16.v),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: Obx(() => _buildLastName(
//                       lastName: "lbl_last_name".tr, abram: controller.myProfileModelObj.value.lastName)),
//                 ),
//                 SizedBox(height: 16.v),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: Obx(() => _buildLastName(
//                       lastName: "lbl_email_address".tr, abram: controller.myProfileModelObj.value.email)),
//                 ),
//                 SizedBox(height: 5.v),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLastName({
//     required String lastName,
//     required String abram,
//   }) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
//       decoration: AppDecoration.fillGray.copyWith(
//         color: appTheme.textfieldFillColor,
//         borderRadius: BorderRadiusStyle.roundedBorder16,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             lastName,
//             style: CustomTextStyles.bodyLargeGray60001.copyWith(color: appTheme.gray60001),
//           ),
//           SizedBox(height: 8.v),
//           Text(
//             abram,
//             style: CustomTextStyles.titleMedium16.copyWith(color: appTheme.black900),
//           ),
//         ],
//       ),
//     );
//   }

//   onTapMyProfile() {
//     Get.toNamed(
//       AppRoutes.editProfileScreen,
//     );
//   }

//   onTapImgIcEdit() {
//     Get.toNamed(
//       AppRoutes.editProfileScreen,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'controller/my_profile_controller.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  MyProfileController controller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: controller.fetchUserProfile(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: LoadingAnimationWidget.prograssiveDots(color: Colors.green, size: 50));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Column(
                    children: [
                      getCommonAppBar(
                        "lbl_my_profile".tr,
                        actionwidget: Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: InkWell(
                            onTap: onTapMyProfile,
                            child: CustomImageView(
                              color: appTheme.black900,
                              imagePath: ImageConstant.imgIcEdit,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              margin: EdgeInsets.only(top: 2.v, bottom: 10.v),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: controller.myProfileModelObj.value.image,
                                // imagePath: ImageConstant.imgAvtar1,
                                height: 80.adaptSize,
                                width: 80.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 9.v),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => Row(
                                          children: [
                                            Text(
                                              controller.myProfileModelObj.value.firstName,
                                              style: theme.textTheme.titleLarge!.copyWith(
                                                color: appTheme.black900,
                                              ),
                                            ),
                                            SizedBox(width: 4.0),
                                            Text(
                                              controller.myProfileModelObj.value.lastName,
                                              style: theme.textTheme.titleLarge!.copyWith(
                                                color: appTheme.black900,
                                              ),
                                            ),
                                          ],
                                        )),
                                    SizedBox(height: 14.v),
                                    Obx(() => Text(
                                          controller.myProfileModelObj.value.email,
                                          style: theme.textTheme.bodyLarge!.copyWith(
                                            color: appTheme.black900,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 32.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Obx(() => _buildLastName(
                            lastName: "lbl_first_name".tr, abram: controller.myProfileModelObj.value.firstName)),
                      ),
                      SizedBox(height: 16.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Obx(() => _buildLastName(
                            lastName: "lbl_last_name".tr, abram: controller.myProfileModelObj.value.lastName)),
                      ),
                      SizedBox(height: 16.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Obx(() => _buildLastName(
                            lastName: "lbl_email_address".tr, abram: controller.myProfileModelObj.value.email)),
                      ),
                      SizedBox(height: 5.v),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLastName({
    required String lastName,
    required String abram,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
      decoration: AppDecoration.fillGray.copyWith(
        color: appTheme.textfieldFillColor,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lastName,
            style: CustomTextStyles.bodyLargeGray60001.copyWith(color: appTheme.gray60001),
          ),
          SizedBox(height: 8.v),
          Text(
            abram,
            style: CustomTextStyles.titleMedium16.copyWith(color: appTheme.black900),
          ),
        ],
      ),
    );
  }

  onTapMyProfile() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
