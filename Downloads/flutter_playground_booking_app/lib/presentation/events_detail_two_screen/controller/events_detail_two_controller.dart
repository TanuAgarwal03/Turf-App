
/// A controller class for the EventsDetailTwoScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/events_detail_two_screen/models/events_detail_two_model.dart';

import '../../detail_screen/models/ground_list_model.dart';
import '../models/eventsdetailtwo_item_model.dart';

///
/// This class manages the state of the EventsDetailTwoScreen, including the
/// current eventsDetailTwoModelObj
class EventsDetailTwoController extends GetxController {
 List<EventsdetailtwoItemModel> facilityList = EventsDetailTwoModel.getFacilitiesList();
 List<GroundListModel> groundList = EventsDetailTwoModel.getGroundList();
 int currentGround = 0;
}
