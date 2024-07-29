import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../models/detail_model.dart';
import '../models/detailscreen_item_model.dart';
import '../models/ground_list_model.dart';


class DetailController extends GetxController {
  PageController pageController = PageController();
  int currentPage = 0;
  int currentGround = 0;
  List<DetailscreenItemModel> facilityList = DetailModel.getFacilityList();
  List<GroundListModel> groundList = DetailModel.getGroundList();
}
