import 'package:flutter_playground_booking_app/core/app_export.dart';

import 'foot_ball_model.dart';

class FootBallData{
  static List<FootBallModel> getFootBollData(){
    return [
      FootBallModel(ImageConstant.imgFunnyStartsKi1, "Supports on either side of the goal.", "Agrasen institute","8 KM"),
      FootBallModel(ImageConstant.imgFunnyStartsKi2, "Which is india's no 1 football ground", "The Walt Disney Company","9 KM"),
      FootBallModel(ImageConstant.imgFunnyStartsKi3, "Dalhousie ac, traders club and Naval Volunt.", "General Electric","10 KM"),
    ];
  }
}