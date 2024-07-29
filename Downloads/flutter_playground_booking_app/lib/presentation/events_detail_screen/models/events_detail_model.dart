import '../../../core/app_export.dart';
import 'eventsdetail_item_model.dart';

/// This class defines the variables used in the [events_detail_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EventsDetailModel {

 static List<EventsdetailItemModel> getPreviousMemoryList() {
    return [
      EventsdetailItemModel(ImageConstant.imgRectangle40189),
      EventsdetailItemModel(ImageConstant.imgRectangle40190),
      EventsdetailItemModel(ImageConstant.imgRectangle40191),
      EventsdetailItemModel(ImageConstant.imgRectangle40192),
      EventsdetailItemModel(ImageConstant.imgRectangle40189),
      EventsdetailItemModel(ImageConstant.imgRectangle40190),
      EventsdetailItemModel(ImageConstant.imgRectangle40191),
      EventsdetailItemModel(ImageConstant.imgRectangle40192),
    ];
  }
}
