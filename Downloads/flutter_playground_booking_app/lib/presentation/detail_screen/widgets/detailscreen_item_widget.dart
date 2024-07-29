import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../controller/detail_controller.dart';
import '../models/ground_list_model.dart';

// ignore: must_be_immutable
class DetailscreenItemWidget extends StatelessWidget {
  DetailscreenItemWidget(
    this.detailscreenItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GroundListModel detailscreenItemModelObj;

  var controller = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.currentGround =
              controller.groundList.indexOf(detailscreenItemModelObj);
          controller.update();
        },
        child: Container(
          padding: EdgeInsets.all(3.h),
          decoration: AppDecoration.outlinePrimary.copyWith(
            color: appTheme.textfieldFillColor,
            border: Border.all(
                color: controller.currentGround ==
                        controller.groundList.indexOf(detailscreenItemModelObj)
                    ? appTheme.buttonColor
                    : Colors.transparent),
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          width: 118.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: detailscreenItemModelObj.image,
                height: 107.v,
                width: 110.h,
                radius: BorderRadius.circular(
                  16.h,
                ),
              ),
              SizedBox(height: 10.v),
              Text(
                detailscreenItemModelObj.title!,
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 6.v),
              Text(
                detailscreenItemModelObj.time!,
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 6.v),
            ],
          ),
        ),
      ),
    );
  }
}
