import '../controller/events_detail_controller.dart';
import '../models/eventsdetail_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class EventsdetailItemWidget extends StatelessWidget {
  EventsdetailItemWidget(
    this.eventsdetailItemModelObj, this.index,{
    Key? key,
  }) : super(
          key: key,
        );

  EventsdetailItemModel eventsdetailItemModelObj;
  int index ;


  EventsDetailController controller = Get.put(EventsDetailController());
  var eventsDetailController = Get.find<EventsDetailController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageView(
          imagePath: eventsdetailItemModelObj.image,
          height: double.infinity,
          width: double.infinity,
          radius: BorderRadius.only(
            topLeft: Radius.circular(index==3?0:16.h),
            topRight: Radius.circular(index==2?0:16.h),
            bottomLeft: Radius.circular(index==1?0:16.h),
            bottomRight: Radius.circular(index==0?0:16.h),
          ),
        ),
        index==3?Container(
          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.60),borderRadius: BorderRadius.only(
            topLeft: Radius.circular(index==3?0:16.h),
            topRight: Radius.circular(index==2?0:16.h),
            bottomLeft: Radius.circular(index==1?0:16.h),
            bottomRight: Radius.circular(index==0?0:16.h),
          ),),
          child: Center(child: Text("+${eventsDetailController.previouseMemory.length - 4} Posts",style: TextStyle(color: appTheme.whiteA700,fontSize: 20.fSize),)),
        ):SizedBox()
      ],
    );
  }
}
