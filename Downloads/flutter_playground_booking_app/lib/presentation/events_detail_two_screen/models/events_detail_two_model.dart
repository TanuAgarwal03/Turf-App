import '../../../core/app_export.dart';
import '../../detail_screen/models/ground_list_model.dart';
import 'eventsdetailtwo_item_model.dart';

/// This class defines the variables used in the [events_detail_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EventsDetailTwoModel {


 static List<EventsdetailtwoItemModel> getFacilitiesList(){
  return [
   EventsdetailtwoItemModel(ImageConstant.imgRectangle3463281,"Main ground"),
    EventsdetailtwoItemModel(ImageConstant.imgRectangle3463281107x110,"Futsal Ground"),
    EventsdetailtwoItemModel(ImageConstant.imgRectangle34632811,"Tenis ground"),
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
