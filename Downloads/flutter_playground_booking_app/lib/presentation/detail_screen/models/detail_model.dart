import '../../../core/app_export.dart';
import 'detailscreen_item_model.dart';
import 'ground_list_model.dart';

/// This class defines the variables used in the [detail_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DetailModel {



  static List<DetailscreenItemModel> getFacilityList(){
    return [
      DetailscreenItemModel( ImageConstant.imgParkingIcon,"Parking"),
      DetailscreenItemModel( ImageConstant.imgCameraIcon,"Camera"),
      DetailscreenItemModel( ImageConstant.imgWaaitingRoomIcon,"Waiting room"),
      DetailscreenItemModel( ImageConstant.imgChangingRoomIcon,"Change room"),
    ];
  }

  static List<GroundListModel> getGroundList(){
    return [
      GroundListModel( ImageConstant.imgRectangle3463281,"Main ground","3 Hour"),
      GroundListModel( ImageConstant.imgRectangle3463281107x110,"Futsal Ground","1 Hour"),
      GroundListModel( ImageConstant.imgRectangle34632811,"Tenis ground","2 Hour"),
    ];
  }



}


  // Rx<List<DetailscreenItemModel>> detailscreenItemList = Rx([
  //   DetailscreenItemModel(
  //       mainground: ImageConstant.imgRectangle3463281.obs,
  //       mainGround: "Main ground".obs,
  //       duration: "3 Hour".obs),
  //   DetailscreenItemModel(
  //       mainground: ImageConstant.imgRectangle3463281107x110.obs,
  //       mainGround: "Futsal Ground".obs,
  //       duration: "1 Hour".obs),
  //   DetailscreenItemModel(
  //       mainground: ImageConstant.imgRectangle34632811.obs,
  //       mainGround: "Tenis ground".obs,
  //       duration: "2 Hour".obs)
  // ]);
// }
