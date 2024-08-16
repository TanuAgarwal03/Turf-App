import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  // final ReviewController controller = Get.find();
  late int turfId;

  @override
  void initState() {
    super.initState();
    print('Retrieved arguments: ${Get.arguments}');

    turfId = Get.arguments as int? ?? 0;
    print('Turf ID in initState: $turfId');
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                getCommonAppBar("lbl_reviews".tr),
                Expanded(
                  child: Obx(() {
                    if (controller.reviewList.isEmpty) {
                      return Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                              color: const Color.fromARGB(255, 71, 119, 73),
                              size: 35));
                    } else {
                      return ListView.separated(
                        padding: EdgeInsets.only(
                            left: 20.h, right: 20.h, bottom: 100.h),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        separatorBuilder: (context, index) {
                          return Opacity(
                              opacity: 0.1,
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 15.0.v),
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
                    }
                    
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
                        padding: EdgeInsets.only(
                            bottom: 32.v, top: 16.v, left: 20.h, right: 20.h),
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
  onTapWriteAReviews() {
    print(" Turf id passed in write review : $turfId");
    Get.toNamed(AppRoutes.writeAReviewScreen, arguments: turfId);
  }
}