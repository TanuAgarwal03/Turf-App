import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/my_booking_upcoming_tab_container_screen/models/my_booking_upcoming_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MyBookingUpcomingTabContainerScreen.
///
/// This class manages the state of the MyBookingUpcomingTabContainerScreen, including the
/// current myBookingUpcomingTabContainerModelObj
class MyBookingUpcomingTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<MyBookingUpcomingTabContainerModel> myBookingUpcomingTabContainerModelObj =
      MyBookingUpcomingTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
