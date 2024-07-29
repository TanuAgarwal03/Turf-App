import 'package:flutter/material.dart';

/// A controller class for the HomePage.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/home_page/models/home_model.dart';

///
/// This class manages the state of the HomePage, including the
/// current homeModelObj
class HomeController extends GetxController {
  HomeController(this.homeModelObj);

  TextEditingController searchController = TextEditingController();

  TextEditingController iclocationController = TextEditingController();

  TextEditingController iclocationController1 = TextEditingController();

  Rx<HomeModel> homeModelObj;

}
