
/// This class is used in the [eventsdetail_item_widget] screen.

// class EventsdetailItemModel {
//   String? image;
//   EventsdetailItemModel(this.image);
// }
class EventsdetailItemModel {
  String? image;
  String? description;// Add other necessary fields
  String? dateTime;
  String? title;
  EventsdetailItemModel({this.image, this.dateTime , this.description , this.title});

  factory EventsdetailItemModel.fromJson(Map<String, dynamic> json) {
    return EventsdetailItemModel(
      image: json['acf']['event_image'],
      description: json['acf']['description'],
      dateTime: json['acf']['event_date_and_time'],
      title: json['title']['rendered'],
    );
  }
}