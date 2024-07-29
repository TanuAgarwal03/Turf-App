import 'package:flutter_playground_booking_app/presentation/detail_screen/models/ground_list_model.dart';

import '../controller/events_detail_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class EventsdetailtwoItemWidget extends StatelessWidget {
  EventsdetailtwoItemWidget(
    this.eventsdetailtwoItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GroundListModel eventsdetailtwoItemModelObj;

  var controller = Get.find<EventsDetailTwoController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsDetailTwoController>(
      init: EventsDetailTwoController(),
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.currentGround =
              controller.groundList.indexOf(eventsdetailtwoItemModelObj);
          controller.update();
        },
        child: Container(
          padding: EdgeInsets.all(3.h),
          decoration: AppDecoration.outlinePrimary.copyWith(
            color: appTheme.textfieldFillColor,
            border: Border.all(
                color: controller.currentGround ==
                    controller.groundList.indexOf(eventsdetailtwoItemModelObj)
                    ? appTheme.buttonColor
                    : Colors.transparent),
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          width: 118.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: eventsdetailtwoItemModelObj.image,
                height: 107.v,
                width: 110.h,
                radius: BorderRadius.circular(
                  16.h,
                ),
              ),
              SizedBox(height: 10.v),
              Text(
                eventsdetailtwoItemModelObj.title!,
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 6.v),
              Text(
                eventsdetailtwoItemModelObj.time!,
                style: theme.textTheme.bodyMedium,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
