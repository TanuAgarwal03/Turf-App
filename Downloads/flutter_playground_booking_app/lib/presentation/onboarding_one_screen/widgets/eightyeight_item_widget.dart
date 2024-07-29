import '../controller/onboarding_one_controller.dart';
import '../models/eightyeight_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class EightyeightItemWidget extends StatelessWidget {
  EightyeightItemWidget(
    this.eightyeightItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  EightyeightItemModel eightyeightItemModelObj;

  var controller = Get.find<OnboardingOneController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "msg_one_step_solution".tr,
          style: theme.textTheme.headlineMedium,
        ),
        SizedBox(height: 18.v),
        SizedBox(
          width: 365.h,
          child: Text(
            "msg_the_process_of_tracking".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(
              height: 1.50,
            ),
          ),
        ),
      ],
    );
  }
}
