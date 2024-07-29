import '../../../core/app_export.dart';

/// This class defines the variables used in the [onboarding_one_screen],
import 'eightyeight_item_model.dart';

/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingOneModel {
  static List<EightyeightItemModel> getOnboardingData() {
    return [
      EightyeightItemModel(
          ImageConstant.onboardingbg1,
          ImageConstant.onboardingbg1Player,
          "One-step solution to book",
          "The process of tracking a mobile number is straightforward a person can enter the phone number."),
      EightyeightItemModel(
          ImageConstant.onboardingbg2,
          ImageConstant.onboardingbg2Player,
          "Search ground want book",
          "He took me for a ride on his He gave me a ride on his had my first ride in a limousine"),
      EightyeightItemModel(
          ImageConstant.onboardingbg3,
          ImageConstant.onboardingbg3Player,
          "Will get about tournament",
          "Some of the most common types of tournaments are Knock-out or Elimination Tournament"),
    ];
  }

}
