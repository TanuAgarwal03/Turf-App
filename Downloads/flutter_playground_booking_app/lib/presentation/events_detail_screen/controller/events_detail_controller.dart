import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../models/events_detail_model.dart';
import '../models/eventsdetail_item_model.dart';


class EventsDetailController extends GetxController {
 List<EventsdetailItemModel> previouseMemory = EventsDetailModel.getPreviousMemoryList();
 PageController pageController = PageController();
 int currentPage = 0;
 int currentGround = 0;
}
