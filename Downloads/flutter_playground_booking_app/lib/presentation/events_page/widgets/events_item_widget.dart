import '../controller/events_controller.dart';
import '../models/events_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class EventsItemWidget extends StatelessWidget {
  EventsItemWidget(
    this.eventsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  EventsItemModel eventsItemModelObj;

  var controller = Get.find<EventsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.eventsDetailScreen);
      },
      child: Container(
        padding: EdgeInsets.all(4.h),
        decoration: AppDecoration.fillGray.copyWith(
          color: appTheme.textfieldFillColor,
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: eventsItemModelObj.image!,
              height: 100.adaptSize,
              width: 100.adaptSize,
              radius: BorderRadius.circular(
                16.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 8.v,
                bottom: 5.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventsItemModelObj.footballTournament!,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: appTheme.black900,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    eventsItemModelObj.date!,
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 9.v),
                  CustomElevatedButton(
                    height: 29.v,
                    width: 77.h,
                    text: "lbl_explore".tr,
                    buttonTextStyle: CustomTextStyles.bodyMediumPrimaryContainer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
