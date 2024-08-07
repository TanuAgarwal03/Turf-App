
import 'package:flutter_playground_booking_app/core/utils/image_constant.dart';
import 'package:flutter_playground_booking_app/presentation/detail_screen/models/detail_model.dart';

class DetailscreenItemModel {
  String? icon;
  String? title;
  DetailscreenItemModel(this.icon,this.title);

  static List<DetailscreenItemModel> fromFacilities(List<Facility> facilities) {
    return facilities.map((facility) {
      return DetailscreenItemModel(
        ImageConstant.imageNotFound, 
        facility.listOfAminities,
      );
    }).toList();
  }
}
