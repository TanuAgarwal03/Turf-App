import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/events_page/models/events_model.dart';

import '../models/events_item_model.dart';

/// A controller class for the EventsPage.
///
/// This class manages the state of the EventsPage, including the
/// current eventsModelObj
class EventsController extends GetxController {
 List<EventsItemModel> eventDataList = EventsModel.getEventsData();
}
