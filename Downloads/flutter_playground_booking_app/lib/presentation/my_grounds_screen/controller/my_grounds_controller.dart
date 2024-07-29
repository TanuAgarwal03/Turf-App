import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/my_grounds_screen/models/my_grounds_model.dart';

import '../models/mygrounds_item_model.dart';

/// A controller class for the MyGroundsScreen.
///
/// This class manages the state of the MyGroundsScreen, including the
/// current myGroundsModelObj
class MyGroundsController extends GetxController {
 List<MygroundsItemModel>  myGroundList = MyGroundsModel.getMyGroundData();
}
