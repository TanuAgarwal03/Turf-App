import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/rate_us_experirnce_screen/models/rate_us_experirnce_model.dart';

/// A controller class for the RateUsExperirnceScreen.
///
/// This class manages the state of the RateUsExperirnceScreen, including the
/// current rateUsExperirnceModelObj
class RateUsExperirnceController extends GetxController {
  Rx<RateUsExperirnceModel> rateUsExperirnceModelObj =
      RateUsExperirnceModel().obs;
}
