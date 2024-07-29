import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/notification_screen/models/notification_model.dart';

import '../models/notification_item_model.dart';

/// A controller class for the NotificationScreen.
///
/// This class manages the state of the NotificationScreen, including the
/// current notificationModelObj
class NotificationController extends GetxController {
 List<NotificationItemModel> notificationDataList = NotificationModel.getNotificationData();
}
