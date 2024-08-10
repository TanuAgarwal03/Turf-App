import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  late int categoryId;
  late String title;

  final Map<int, String> categoryNames = {
    7: 'Badminton',
    8: 'Basketball',
    9: 'Cricket',
    10: 'Swimming Pool',
    11: 'Football',
    12: 'Kabaddi',
    13: 'Volleyball',
    14: 'Golf',
  };

  @override
  void initState() {
    super.initState();
    if (Get.arguments is Map<String, dynamic>) {
      final arguments = Get.arguments as Map<String, dynamic>;
      categoryId = arguments['categoryId'] as int;
      title = arguments['title'] as String;
    } else {
      categoryId = Get.arguments as int;
      title = categoryNames[categoryId] ?? categoryId.toString();
    }
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
              getCommonAppBar(title),
              SizedBox(height: 16.v),
              Expanded(
                child: Obx(() {
                  if (controller.footBallList.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        LoadingAnimationWidget.bouncingBall(color: Colors.black, size: 25),
                        Text(
                        'No grounds available for this category.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16, 
                          color: Colors.black,
                        ),
                      ),
                      ],)
                    );
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
                                final prefs =
                                    await SharedPreferences.getInstance();
                                if (model.id != null) {
                                  await prefs.setInt('turfId', model.id!);
                                  print('turf id in category : ${model.id}');
                                  Get.toNamed(AppRoutes.detailScreen,
                                      arguments: {'id': model.id});
                                } else {
                                  print('model.id is null : ${model.id}');
                                }
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
                                      image: model.turfImage.toString(),
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
                                          Container(
                                              width: 280,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.h),
                                                child: Text(
                                                  model.address ?? 'data',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: theme
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                    color: appTheme.black900,
                                                  ),
                                                ),
                                              )),
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
      ]),
    );
  }
}
