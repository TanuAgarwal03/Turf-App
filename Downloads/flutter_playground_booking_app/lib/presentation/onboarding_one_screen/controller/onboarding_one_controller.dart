import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/onboarding_one_screen/models/onboarding_one_model.dart';

import '../models/eightyeight_item_model.dart';

/// A controller class for the OnboardingOneScreen.
///
/// This class manages the state of the OnboardingOneScreen, including the
/// current onboardingOneModelObj
class OnboardingOneController extends GetxController {
 List<EightyeightItemModel> onboardingList =  OnboardingOneModel.getOnboardingData();
 PageController pageController = PageController();
 Rx<int> sliderIndex = 0.obs;
 int currentPage = 0;

 void setCurrentPage(int value) {
  currentPage = value;
  update();
 }

}
