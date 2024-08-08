import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/widgets/popularground_item_widget.dart';
import 'controller/popular_ground_controller.dart';
import 'models/popularground_item_model.dart';

class PopularGroundScreen extends StatefulWidget {
  const PopularGroundScreen({super.key});

  @override
  State<PopularGroundScreen> createState() => _PopularGroundScreenState();
}

class _PopularGroundScreenState extends State<PopularGroundScreen> {
  PopularGroundController controller = Get.put(PopularGroundController());

  @override
  Widget build(BuildContext context) {
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
        child: Obx(() {
          if (controller.popularGround.isEmpty) {
          return Center(child: Text('No popular grounds available'));
        }
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.v);
            },
            itemCount: controller.popularGround.length,
            itemBuilder: (context, index) {
              PopulargroundItemModel model = controller.popularGround[index];
              return animationfunction(
                index,
                PopulargroundItemWidget(model),
              );
            },
          );
        }),
      ),
    );
  }
}
