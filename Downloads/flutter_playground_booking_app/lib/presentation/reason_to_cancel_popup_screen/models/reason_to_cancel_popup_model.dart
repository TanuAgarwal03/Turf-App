import 'cancel_order_reason_data_model.dart';

/// This class defines the variables used in the [reason_to_cancel_popup_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ReasonToCancelPopupModel {

  static List<ResonModel> getReasonData(){
    return [
      ResonModel("I don’t have enough teammates.",1),
      ResonModel("I don’t like the venue.",2),
      ResonModel("I am shifting to another city.",3),
      ResonModel("Wrong venue.",4),
      ResonModel("I have changed my mind.",5),
      ResonModel("Other",6),
    ];
  }
}
