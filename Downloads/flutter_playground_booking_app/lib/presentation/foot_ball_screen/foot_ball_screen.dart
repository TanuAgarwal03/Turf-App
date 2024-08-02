// // ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/foot_ball_controller.dart';
import 'models/foot_ball_model.dart';

class FootBallScreen extends StatefulWidget {
  const FootBallScreen({super.key});

  @override
  State<FootBallScreen> createState() => _FootBallScreenState();
}

class _FootBallScreenState extends State<FootBallScreen> {
  final FootBallController controller = Get.put(FootBallController());
  final int categoryId = Get.arguments as int;

  @override
  void initState() {
    super.initState();
    controller.fetchFootBallData(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    print(categoryId);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              getCommonAppBar("lbl_foot_ball".tr),
              SizedBox(height: 16.v),
              Expanded(
                child: Obx(() {
                  if (controller.footBallList.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: controller.footBallList.length,
                      itemBuilder: (context, index) {
                        FootBallModel model = controller.footBallList[index];
                        return animationfunction(
                          index,
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.v),
                            child: GestureDetector(
                              onTap: () async {
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setInt('turfId', model.id!);
                                print('turf id in category : ${model.id}');
                                Get.toNamed(
                                  AppRoutes.detailScreen,arguments: model.id
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.h),
                                decoration: AppDecoration.fillGray.copyWith(
                                  color: appTheme.textfieldFillColor,
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildSeventeen(
                                      image: model.turfImage
                                          .toString(), // Ensure image is used correctly
                                      distance: model.price ?? '',
                                    ),
                                    SizedBox(height: 12.v),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.h),
                                      child: Text(
                                        model.title ?? '',
                                        style: theme.textTheme.titleMedium!
                                            .copyWith(
                                          color: appTheme.black900,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.h),
                                      child: Row(
                                        children: [
                                          CustomImageView(
                                            color: appTheme.black900,
                                            imagePath:
                                                ImageConstant.imgIcLocation,
                                            height: 20.adaptSize,
                                            width: 20.adaptSize,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.h),
                                            child: Text(
                                              model.address ?? 'data',
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                color: appTheme.black900,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16.v),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSeventeen({
    required String image,
    required String distance,
  }) {
    return SizedBox(
      height: 163.v,
      width: double.infinity,
      child: Stack(alignment: Alignment.topRight, children: [
        CustomImageView(
          imagePath: image,
          height: 163.v,
          width: double.infinity,
          radius: BorderRadius.circular(16.h),
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(top: 12.v, right: 12.h),
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.v),
            decoration: AppDecoration.white
                .copyWith(borderRadius: BorderRadiusStyle.circleBorder10),
            child: Text(
              distance,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.colorScheme.onErrorContainer),
            ),
          ),
        ),
      ]),
    );
  }
}
