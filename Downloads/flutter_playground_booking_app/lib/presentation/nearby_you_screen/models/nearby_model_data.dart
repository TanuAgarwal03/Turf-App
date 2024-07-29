import '../../../core/utils/image_constant.dart';
import 'nearby_you_model.dart';

class NearbyYouData {
  static List<NearbyYouModel> getNearbyYouData() {
    return [
      NearbyYouModel(
          ImageConstant.imgFunnyStartsKi,
          "Stadium in lights and flashes, fosts",
          "Shot smiley girl jumping rope",
          "8 KM"),
      NearbyYouModel(ImageConstant.imgFunnyStartsKi150x298,
          "Stadium with a lot of seats sky.", "Agrasen institute", "9 KM"),
      NearbyYouModel(ImageConstant.imgFunnyStartsKi4,
          "Cricket world cup trophy generative", "Viet nam", "10 KM"),
    ];
  }
}
