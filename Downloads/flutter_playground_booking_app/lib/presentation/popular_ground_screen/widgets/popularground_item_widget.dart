// import '../controller/popular_ground_controller.dart';
// import '../models/popularground_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';

// // ignore: must_be_immutable
// class PopulargroundItemWidget extends StatelessWidget {
//   PopulargroundItemWidget(
//     this.populargroundItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );

//   PopulargroundItemModel populargroundItemModelObj;
//   var controller = Get.find<PopularGroundController>();

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PopularGroundController>(
//       init: PopularGroundController(),
//       builder: (controller) => GestureDetector(
//         onTap: () {
//           controller.currentImage = populargroundItemModelObj.image!;
//           controller.update();
//           Get.toNamed(AppRoutes.detailScreen);
//         },
//         child: Container(
//           width: double.infinity,
//           decoration: AppDecoration.fillGray.copyWith(
//             color: appTheme.textfieldFillColor,
//             borderRadius: BorderRadiusStyle.roundedBorder16,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Hero(
//                 tag: populargroundItemModelObj.image!,
//                 child: CustomImageView(
//                   imagePath: populargroundItemModelObj.image,
//                   height: 181.v,
//                   width: double.infinity,
//                   radius: BorderRadius.circular(
//                     16.h,
//                   ),
//                   alignment: Alignment.topCenter,
//                 ),
//               ),
//               SizedBox(height: 16.v),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           populargroundItemModelObj.title!,
//                           style: theme.textTheme.titleMedium!.copyWith(
//                             color: appTheme.black900,
//                           ),
//                         ),
//                         SizedBox(height: 4.5.v),
//                         Row(
//                           children: [
//                             CustomImageView(
//                               color: appTheme.black900,
//                               imagePath: ImageConstant.imgIcLocation,
//                               height: 20.adaptSize,
//                               width: 20.adaptSize,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(left: 8.h),
//                               child: Text(populargroundItemModelObj.location!,
//                                   style: theme.textTheme.bodyMedium!.copyWith(
//                                     color: appTheme.black900,
//                                   )),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         CustomImageView(
//                           imagePath: populargroundItemModelObj.isBadminton!
//                               ? ImageConstant.imgShuttlecock31
//                               : ImageConstant.imgShuttlecock1,
//                           height: 24.adaptSize,
//                           width: 24.adaptSize,
//                         ),
//                         SizedBox(width: 8.h),
//                         CustomImageView(
//                           imagePath: populargroundItemModelObj.isCricket!
//                               ? ImageConstant.imgBall1LightGreen400
//                               : ImageConstant.imgTennisBall1,
//                           height: 24.adaptSize,
//                           width: 24.adaptSize,
//                         ),
//                         SizedBox(width: 8.h),
//                         CustomImageView(
//                           imagePath: populargroundItemModelObj.isFootball!
//                               ? ImageConstant.imgBasketBall
//                               : ImageConstant.imgBasketBall,
//                           height: 24.adaptSize,
//                           width: 24.adaptSize,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.v),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';
// import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/models/popularground_item_model.dart';

// class PopulargroundItemWidget extends StatelessWidget {
//   final PopulargroundItemModel populargroundItemModelObj;

//   PopulargroundItemWidget(this.populargroundItemModelObj, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to detail screen with necessary data
//         Get.toNamed(AppRoutes.detailScreen);
//       },
//       child: Container(
//         width: double.infinity,
//         decoration: AppDecoration.fillGray.copyWith(
//           color: appTheme.textfieldFillColor,
//           borderRadius: BorderRadiusStyle.roundedBorder16,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Hero(
//               tag: populargroundItemModelObj.image!,
//               child: CustomImageView(
//                 imagePath: populargroundItemModelObj.image,
//                 height: 181.v,
//                 width: double.infinity,
//                 radius: BorderRadius.circular(16.h),
//                 alignment: Alignment.topCenter,
//               ),
//             ),
//             SizedBox(height: 16.v),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         populargroundItemModelObj.title!,
//                         style: theme.textTheme.titleMedium!.copyWith(
//                           color: appTheme.black900,
//                         ),
//                       ),
//                       SizedBox(height: 4.5.v),
//                       Row(
//                         children: [
//                           CustomImageView(
//                             color: appTheme.black900,
//                             imagePath: ImageConstant.imgIcLocation,
//                             height: 20.adaptSize,
//                             width: 20.adaptSize,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 8.h),
//                             child: Text(
//                               populargroundItemModelObj.location!,
//                               style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: appTheme.black900,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       // Displaying icons based on facilities
//                       for (var facility in populargroundItemModelObj.facilities!)
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.h),
//                           child: CustomImageView(
//                             imagePath: getFacilityIcon(facility),
//                             height: 24.adaptSize,
//                             width: 24.adaptSize,
//                           ),
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16.v),
//           ],
//         ),
//       ),
//     );
//   }

//   String getFacilityIcon(String facility) {
//     switch (facility) {
//       case 'hello':
//         return ImageConstant.imgShuttlecock31;
//       case 'world':
//         return ImageConstant.imgBall1LightGreen400;
//       // Add more cases for other amenities
//       default:
//         return ImageConstant.imgBasketBall;
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/models/popularground_item_model.dart';

class PopulargroundItemWidget extends StatelessWidget {
  final PopulargroundItemModel populargroundItemModelObj;

  PopulargroundItemWidget(this.populargroundItemModelObj, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailScreen);
      },
      child: Container(
        width: double.infinity,
        decoration: AppDecoration.fillGray.copyWith(
          color: appTheme.textfieldFillColor,
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: populargroundItemModelObj.image ?? 'assets/images/img_soccer_1.svg',
              child: CustomImageView(
                imagePath: populargroundItemModelObj.image,
                height: 181.v,
                width: double.infinity,
                radius: BorderRadius.circular(16.h),
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(height: 16.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        populargroundItemModelObj.title!,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.black900,
                        ),
                      ),
                      SizedBox(height: 4.5.v),
                      Row(
                        children: [
                          CustomImageView(
                            color: appTheme.black900,
                            imagePath: ImageConstant.imgIcLocation,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              populargroundItemModelObj.location!,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: appTheme.black900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      if (populargroundItemModelObj.isBadminton == true)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgShuttlecock31,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                      if (populargroundItemModelObj.isCricket == true)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgBall1LightGreen400,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                      if (populargroundItemModelObj.isFootball == true)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgBasketBall,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.v),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/popular_ground_controller.dart';
// import '../models/popularground_item_model.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';

// // ignore: must_be_immutable
// class PopulargroundItemWidget extends StatelessWidget {
//   PopulargroundItemWidget(this.populargroundItemModelObj, {Key? key}) : super(key: key);

//   PopulargroundItemModel populargroundItemModelObj;
//   var controller = Get.find<PopularGroundController>();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         controller.currentImage = populargroundItemModelObj.image!;
//         controller.update();
//         Get.toNamed(AppRoutes.detailScreen);
//       },
//       child: Container(
//         width: double.infinity,
//         decoration: AppDecoration.fillGray.copyWith(
//           color: appTheme.textfieldFillColor,
//           borderRadius: BorderRadiusStyle.roundedBorder16,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Hero(
//               tag: populargroundItemModelObj.image!,
//               child: CustomImageView(
//                 imagePath: populargroundItemModelObj.image,
//                 height: 181.v,
//                 width: double.infinity,
//                 radius: BorderRadius.circular(16.h),
//                 alignment: Alignment.topCenter,
//               ),
//             ),
//             SizedBox(height: 16.v),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         populargroundItemModelObj.title!,
//                         style: theme.textTheme.titleMedium!.copyWith(
//                           color: appTheme.black900,
//                         ),
//                       ),
//                       SizedBox(height: 4.5.v),
//                       Row(
//                         children: [
//                           CustomImageView(
//                             color: appTheme.black900,
//                             imagePath: ImageConstant.imgIcLocation,
//                             height: 20.adaptSize,
//                             width: 20.adaptSize,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 8.h),
//                             child: Text(
//                               populargroundItemModelObj.location!,
//                               style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: appTheme.black900,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       CustomImageView(
//                         imagePath: populargroundItemModelObj.isBadminton!
//                             ? ImageConstant.imgShuttlecock31
//                             : ImageConstant.imgShuttlecock1,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                       ),
//                       SizedBox(width: 8.h),
//                       CustomImageView(
//                         imagePath: populargroundItemModelObj.isCricket!
//                             ? ImageConstant.imgBall1LightGreen400
//                             : ImageConstant.imgTennisBall1,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                       ),
//                       SizedBox(width: 8.h),
//                       CustomImageView(
//                         imagePath: populargroundItemModelObj.isFootball!
//                             ? ImageConstant.imgBasketBall
//                             : ImageConstant.imgBasketBall,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16.v),
//           ],
//         ),
//       ),
//     );
//   }
// }
