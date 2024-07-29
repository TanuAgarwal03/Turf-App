import 'notification_item_model.dart';

/// This class defines the variables used in the [notification_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationModel {



  static List<NotificationItemModel> getNotificationData(){
    return [
      NotificationItemModel("Piece of land, at school or in a public area.", "14 Min"),
      NotificationItemModel("Seven-year-old boy playing in playground.", "16 Min"),
      NotificationItemModel("A playground, playpark, or play area place.", "18 Min"),
      NotificationItemModel("A boy that is playing in the  is actually.", "20 Min"),
      NotificationItemModel("Merriam-Webster.com Merriam-Webster.", "22 Min"),
      NotificationItemModel("Whatever and beneficial to kids' physical.", "50 Min"),
      NotificationItemModel("They may also be items of indo American.", "55 Min"),
      NotificationItemModel("A boy that is playing in the  is actually.", "20 Min"),
    ];
  }
}
