import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/models/popular_ground_model.dart';

import '../models/popularground_item_model.dart';

/// A controller class for the PopularGroundScreen.
///
/// This class manages the state of the PopularGroundScreen, including the
/// current popularGroundModelObj
class PopularGroundController extends GetxController {
  List<PopulargroundItemModel> populerGround =
      PopularGroundModel.getPopularGroundData();
String currentimage = "";
}
