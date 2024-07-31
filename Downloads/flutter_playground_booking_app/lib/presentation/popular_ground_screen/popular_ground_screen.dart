// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';
// import '../popular_ground_screen/widgets/popularground_item_widget.dart';
// import 'controller/popular_ground_controller.dart';
// import 'models/popularground_item_model.dart';



// class PopularGroundScreen extends StatefulWidget {
//   const PopularGroundScreen({super.key});

//   @override
//   State<PopularGroundScreen> createState() => _PopularGroundScreenState();
// }

// class _PopularGroundScreenState extends State<PopularGroundScreen> {
//  PopularGroundController controller = Get.put(PopularGroundController());
//  @override
//  Widget build(BuildContext context) {
//   mediaQueryData = MediaQuery.of(context);
//   return Scaffold(
//    backgroundColor: appTheme.bgColor,

//       body: SafeArea(
//         child: SizedBox(
//             width: double.maxFinite,
//             child: Column(children: [
//               getCommonAppBar("lbl_popular_ground".tr),
//              SizedBox(height: 16.v),
//              buildPopularGround(),
//              SizedBox(height: 24.v)
//             ])),
//       ));
//  }

//  /// Section Widget
//  Widget buildPopularGround() {
//   return Expanded(
//       child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.h),
//           child: ListView.separated(
//               physics: BouncingScrollPhysics(),
//               shrinkWrap: true,
//               separatorBuilder: (context, index) {
//                 return SizedBox(height: 16.v);
//               },
//               itemCount: controller.populerGround.length,
//               itemBuilder: (context, index) {
//                 PopulargroundItemModel model = controller
//                     .populerGround[index];
//                 return animationfunction(
//                     index,
//                     PopulargroundItemWidget(model));
//               })));
//  }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/controller/popular_ground_controller.dart';
// import 'package:get/get.dart';
// // import '../controller/popular_ground_controller.dart';
// // import '../models/popularground_item_model.dart';
// import 'widgets/popularground_item_widget.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';

// class PopularGroundScreen extends StatefulWidget {
//   const PopularGroundScreen({Key? key}) : super(key: key);

//   @override
//   State<PopularGroundScreen> createState() => _PopularGroundScreenState();
// }

// class _PopularGroundScreenState extends State<PopularGroundScreen> {
//   PopularGroundController controller = Get.put(PopularGroundController());

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return Scaffold(
//       backgroundColor: appTheme.bgColor,
//       body: SafeArea(
//         child: SizedBox(
//           width: double.maxFinite,
//           child: Column(
//             children: [
//               getCommonAppBar("lbl_popular_ground".tr),
//               SizedBox(height: 16.v),
//               buildPopularGround(),
//               SizedBox(height: 24.v),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildPopularGround() {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.h),
//         child: Obx(
//           () => ListView.separated(
//             physics: BouncingScrollPhysics(),
//             shrinkWrap: true,
//             separatorBuilder: (context, index) {
//               return SizedBox(height: 16.v);
//             },
//             itemCount: controller.popularGround.length,
//             itemBuilder: (context, index) {
//               PopulargroundItemModel model = controller.popularGround[index];
//               return animationFunction(
//                 index,
//                 PopulargroundItemWidget(model),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/controller/popular_ground_controller.dart';
import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/models/popularground_item_model.dart';
import 'package:get/get.dart';
import 'widgets/popularground_item_widget.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

class PopularGroundScreen extends StatefulWidget {
  const PopularGroundScreen({Key? key}) : super(key: key);

  @override
  State<PopularGroundScreen> createState() => _PopularGroundScreenState();
}

class _PopularGroundScreenState extends State<PopularGroundScreen> {
  PopularGroundController controller = Get.put(PopularGroundController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              getCommonAppBar("lbl_popular_ground".tr),
              SizedBox(height: 16.v),
              buildPopularGround(),
              SizedBox(height: 24.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopularGround() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Obx(
          () => ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.v);
            },
            itemCount: controller.popularGround.length,
            itemBuilder: (context, index) {
              PopulargroundItemModel model = controller.popularGround[index];
              return animationFunction(
                index,
                PopulargroundItemWidget(model),
              );
            },
          ),
        ),
      ),
    );
  }
  Widget animationFunction(int index, Widget child) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    child: child,
  );
}
}
