import '../../../core/app_export.dart';
import 'mygrounds_item_model.dart';

class MyGroundsModel {


  static List<MygroundsItemModel> getMyGroundData(){
    return [
      MygroundsItemModel(ImageConstant.imgRectangle3463281, "Main ground", "3 Hour"),
      MygroundsItemModel(ImageConstant.imgRectangle3463281107x110, "Futsal Ground", "1 Hour"),
      MygroundsItemModel(ImageConstant.imgRectangle346328190x90, "Tenis ground", "2 Hour"),
      MygroundsItemModel(ImageConstant.imgRectangle34632812, "Football ground", "4 Hour"),
    ];
  }
}
