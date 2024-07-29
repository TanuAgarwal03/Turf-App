import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/about_us_screen/models/about_us_model.dart';

/// A controller class for the AboutUsScreen.
///
/// This class manages the state of the AboutUsScreen, including the
/// current aboutUsModelObj
class AboutUsController extends GetxController {
  Rx<AboutUsModel> aboutUsModelObj = AboutUsModel().obs;
}
