import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';


class HistrotyUpcomingCompletedTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late TabController tabviewController =
  Get.put(TabController(vsync: this, length: 2));

}