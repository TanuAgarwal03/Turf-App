
/// A controller class for the FootBallScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/foot_ball_screen/models/foot_ball_model.dart';

import '../models/foot_ball_data.dart';

///
/// This class manages the state of the FootBallScreen, including the
/// current footBallModelObj
class FootBallController extends GetxController {
  List<FootBallModel> footBallList = FootBallData.getFootBollData();
}
