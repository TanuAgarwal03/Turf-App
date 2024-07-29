import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/reason_to_cancel_popup_screen/models/reason_to_cancel_popup_model.dart';

import '../models/cancel_order_reason_data_model.dart';

/// A controller class for the ReasonToCancelPopupScreen.
///
/// This class manages the state of the ReasonToCancelPopupScreen, including the
/// current reasonToCancelPopupModelObj
class ReasonToCancelPopupController extends GetxController {
  List<ResonModel> reasonDataList =  ReasonToCancelPopupModel.getReasonData();
  int selectedValue = 3;
}
