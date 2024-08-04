
/// This class is used in the [events_item_widget] screen.

// class EventsItemModel {
//  String? image;
//   String? footballTournament;
//   String? date;
//  EventsItemModel(this.image,this.footballTournament,this.date);
// }
class EventsItemModel {
  String? image;
  String? description;
  String? eventDateAndTime;

  EventsItemModel({
    this.image,
    this.description,
    this.eventDateAndTime,
  });

  factory EventsItemModel.fromJson(Map<String, dynamic> json) {
    return EventsItemModel(
      image: json['acf']['event_image'],
      description: json['acf']['description'],
      eventDateAndTime: json['acf']['event_date_and_time'],
    );
  }
}
