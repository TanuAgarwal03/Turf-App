import '../../../core/app_export.dart';
import 'events_item_model.dart';

/// This class defines the variables used in the [events_page],
/// and is typically used to hold data that is passed between different parts of the application.
class EventsModel {

 static List<EventsItemModel> getEventsData(){
  return [
   EventsItemModel(ImageConstant.imgRectangle40187, "Football tournament 2023", "Registration 15 May"),
    EventsItemModel(ImageConstant.imgRectangle40187100x100, "Cricket tournament 2021", "Registration 15 August"),
    EventsItemModel(ImageConstant.imgRectangle401871, "Vollyball tournament 2023", "Registration 15 May"),
    EventsItemModel(ImageConstant.imgRectangle401872, "Tenis tournament 2023", "Registration 15 May"),
    EventsItemModel(ImageConstant.imgRectangle401873, "Hocky tournament 2023", "Registration 15 May"),
    EventsItemModel(ImageConstant.imgRectangle401874, "Football tournament 2023", "Registration 15 May"),
  ];
 }
}
