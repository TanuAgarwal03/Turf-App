// // import 'package:flutter/material.dart';
// // import 'package:flutter_playground_booking_app/core/app_export.dart';
// // import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
// // import '../review_screen/widgets/review_item_widget.dart';
// // import 'controller/review_controller.dart';
// // import 'models/review_item_model.dart';




// // class ReviewScreen extends StatefulWidget {
// //   const ReviewScreen({super.key});

// //   @override
// //   State<ReviewScreen> createState() => _ReviewScreenState();
// // }

// // class _ReviewScreenState extends State<ReviewScreen> {
// //   ReviewController controller = Get.put(ReviewController());
// //   @override
// //   Widget build(BuildContext context) {
// //     mediaQueryData = MediaQuery.of(context);
// //     return Scaffold(
// //         backgroundColor: appTheme.bgColor,
// //         body: SafeArea(
// //           child: Stack(
// //             children: [
// //               Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     getCommonAppBar("lbl_reviews".tr),
// //                     SizedBox(height: 16.v),
// //                     Expanded(
// //                       child: ListView.separated(
// //                           padding: EdgeInsets.only(left: 20.h,right: 20.h,bottom: 100.h),
// //                           physics: BouncingScrollPhysics(),
// //                           shrinkWrap: true,
// //                           primary: false,
// //                           separatorBuilder: (context, index) {
// //                             return Opacity(
// //                                 opacity: 0.1,
// //                                 child: Padding(
// //                                     padding: EdgeInsets.symmetric(vertical: 15.0.v),
// //                                     child: SizedBox(
// //                                         width: double.infinity,
// //                                         child: Divider(
// //                                             height: 1.v,
// //                                             thickness: 1.v,
// //                                             color:
// //                                             appTheme.gray60001))));
// //                           },
// //                           itemCount:
// //                           controller.reviewList.length,
// //                           itemBuilder: (context, index) {
// //                             ReviewItemModel model = controller
// //                                 .reviewList[index];
// //                             return ReviewItemWidget(model);
// //                           }),
// //                     )
// //                   ]),
// //               Align(
// //                 alignment: Alignment.bottomCenter,
// //                 child: Container(
// //                   color: appTheme.bgColor,
// //                   width: double.infinity,
// //                   child: Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       Padding(
// //                         padding: EdgeInsets.only(bottom: 32.v,top: 16.v,left: 20.h,right: 20.h),
// //                         child: CustomElevatedButton(
// //                             width: double.infinity ,
// //                             text: "lbl_write_a_reviews".tr,
// //                             onPressed: () {
// //                               onTapWriteAReviews();
// //                             },
// //                             alignment: Alignment.bottomCenter),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ));
// //   }



// //   /// Navigates to the detailScreen when the action is triggered.
// //   onTapReviews() {
// //     Get.toNamed(
// //       AppRoutes.detailScreen,
// //     );
// //   }

// //   /// Navigates to the writeAReviewScreen when the action is triggered.
// //   onTapWriteAReviews() {
// //     Get.toNamed(
// //       AppRoutes.writeAReviewScreen,
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'controller/review_controller.dart';
// import 'models/review_item_model.dart';

// class ReviewScreen extends StatefulWidget {
//   const ReviewScreen({super.key});

//   @override
//   State<ReviewScreen> createState() => _ReviewScreenState();
// }

// class _ReviewScreenState extends State<ReviewScreen> {
//   final ReviewController controller = Get.put(ReviewController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reviews'),
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Obx(() {
//                 if (controller.reviewList.isEmpty) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 return ListView.separated(
//                   padding: EdgeInsets.all(16.0),
//                   physics: BouncingScrollPhysics(),
//                   itemCount: controller.reviewList.length,
//                   separatorBuilder: (context, index) => Divider(),
//                   itemBuilder: (context, index) {
//                     ReviewItemModel model = controller.reviewList[index];
//                     return ListTile(
//                       title: Text(model.title),
//                       subtitle: Text('${model.firstName} ${model.lastName} - ${model.description}'),
//                       trailing: Text(model.rating),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ElevatedButton(
//           onPressed: () {
//             Get.toNamed('/write-review'); // Replace with your actual route
//           },
//           child: Text('Write a Review'),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';
import '../review_screen/widgets/review_item_widget.dart';
import 'controller/review_controller.dart';
import 'models/review_item_model.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  ReviewController controller = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCommonAppBar("lbl_reviews".tr),
                    SizedBox(height: 16.v),
                    Expanded(
                      child: Obx(() {
                        if (controller.reviewList.isEmpty) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.separated(
                          padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 100.h),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          separatorBuilder: (context, index) {
                            return Opacity(
                                opacity: 0.1,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15.0.v),
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: Divider(
                                            height: 1.v,
                                            thickness: 1.v,
                                            color: appTheme.gray60001))));
                          },
                          itemCount: controller.reviewList.length,
                          itemBuilder: (context, index) {
                            ReviewItemModel model = controller.reviewList[index];
                            return ReviewItemWidget(model);
                          },
                        );
                      }),
                    ),
                  ]),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: appTheme.bgColor,
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 32.v, top: 16.v, left: 20.h, right: 20.h),
                        child: CustomElevatedButton(
                            width: double.infinity,
                            text: "lbl_write_a_reviews".tr,
                            onPressed: () {
                              onTapWriteAReviews();
                            },
                            alignment: Alignment.bottomCenter),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  /// Navigates to the detailScreen when the action is triggered.
  onTapReviews() {
    Get.toNamed(AppRoutes.detailScreen);
  }

  /// Navigates to the writeAReviewScreen when the action is triggered.
  onTapWriteAReviews() {
    Get.toNamed(AppRoutes.writeAReviewScreen);
  }
}
