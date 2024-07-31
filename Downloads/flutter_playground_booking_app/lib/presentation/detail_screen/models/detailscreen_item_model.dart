
import 'package:flutter_playground_booking_app/core/utils/image_constant.dart';
import 'package:flutter_playground_booking_app/presentation/detail_screen/models/detail_model.dart';

/// This class is used in the [detailscreen_item_widget] screen.

class DetailscreenItemModel {
  String? icon;
  String? title;
  DetailscreenItemModel(this.icon,this.title);

  static List<DetailscreenItemModel> fromFacilities(List<Facility> facilities) {
    return facilities.map((facility) {
      // You may need to map `facility.listOfAminities` to appropriate icons here
      // For simplicity, we use a placeholder image here.
      return DetailscreenItemModel(
        ImageConstant.imageNotFound, // Placeholder for the icon
        facility.listOfAminities,
      );
    }).toList();
  }
}
