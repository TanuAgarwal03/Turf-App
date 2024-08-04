
/// This class is used in the [eventsdetail_item_widget] screen.

// class EventsdetailItemModel {
//   String? image;
//   EventsdetailItemModel(this.image);
// }
class EventsdetailItemModel {
  String? image;
  String? title; // Add other necessary fields
  String? description;
  EventsdetailItemModel({this.image, this.title , this.description});

  factory EventsdetailItemModel.fromJson(Map<String, dynamic> json) {
    return EventsdetailItemModel(
      image: json['acf']['event_image'],
      title: json['acf']['description'],
      description: json['acf']['event_date_and_time'],
    );
  }
}