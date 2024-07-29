// import '../controller/add_photos_controller.dart';
// import '../models/addphotos_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';
//
// // ignore: must_be_immutable
// class AddphotosItemWidget extends StatelessWidget {
//   AddphotosItemWidget(
//     this.addphotosItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );
//
//   AddphotosItemModel addphotosItemModelObj;
//
//   var controller = Get.find<AddPhotosController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 120.v,
//       width: 190.h,
//       child: Stack(
//         alignment: Alignment.topRight,
//         children: [
//           Obx(
//             () => CustomImageView(
//               imagePath: addphotosItemModelObj.image! ,
//               height: 120.v,
//               width: 190.h,
//               radius: BorderRadius.only(
//                 topLeft: Radius.circular(16.h),
//                 topRight: Radius.circular(16.h),
//                 bottomLeft: Radius.circular(16.h),
//               ),
//               alignment: Alignment.center,
//             ),
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: Container(
//               height: 20.adaptSize,
//               width: 20.adaptSize,
//               margin: EdgeInsets.only(
//                 top: 8.v,
//                 right: 8.h,
//               ),
//               decoration: AppDecoration.fillPrimary.copyWith(
//                 borderRadius: BorderRadiusStyle.roundedBorder6,
//               ),
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgIcCheck,
//                 height: 20.adaptSize,
//                 width: 20.adaptSize,
//                 alignment: Alignment.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
