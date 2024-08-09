import 'package:flutter_playground_booking_app/core/utils/image_constant.dart';
import 'package:flutter_playground_booking_app/presentation/detail_screen/models/detail_model.dart';

class DetailscreenItemModel {
  String? icon;
  String? title;

  DetailscreenItemModel(this.icon, this.title);

  static final Map<String, String> titleToIconMap = {
    'Parking': ImageConstant.imgParkingIcon,
    'Changing room': ImageConstant.imgChangingRoomIcon,
    'Washrooms': ImageConstant.imgChangingRoomIcon,
    'CCTV' :  ImageConstant.imgCameraIcon,
    'Camera' : ImageConstant.imgCameraIcon,
    'Canteen' : ImageConstant.imgChangingRoomIcon,
    'Lockers' : ImageConstant.imgChangingRoomIcon,
    'Drinking water' : ImageConstant.imgChangingRoomIcon,
  };

  static List<DetailscreenItemModel> fromFacilities(List<Facility> facilities) {
    return facilities.map((facility) {
      String? icon = titleToIconMap[facility.listOfAminities] ?? ImageConstant.imgNavHistory;

      return DetailscreenItemModel(
        icon, 
        facility.listOfAminities,
      );
    }).toList();
  }
}
