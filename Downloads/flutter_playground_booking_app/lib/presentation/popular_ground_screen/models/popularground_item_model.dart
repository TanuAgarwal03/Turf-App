
/// This class is used in the [popularground_item_widget] screen.

// class PopulargroundItemModel {
//  String? image;
//   String? title;
//   String? location;
//   bool? isBadminton;
//   bool? iscricket;
//   bool? isfootball;
//  PopulargroundItemModel(this.image, this.title, this.location,this.isBadminton, this.iscricket, this.isfootball);
// }
class PopulargroundItemModel {
  String? image;
  String? title;
  String? location;
  bool? isBadminton;
  bool? isCricket;
  bool? isFootball;

  PopulargroundItemModel({this.image, this.title, this.location, this.isBadminton, this.isCricket, this.isFootball});

  factory PopulargroundItemModel.fromJson(Map<String, dynamic> json) {
    return PopulargroundItemModel(
      image: json['image'],
      title: json['title'],
      location: json['location'],
      isBadminton: json['isBadminton'],
      isCricket: json['isCricket'],
      isFootball: json['isFootball'],
    );
  }
}
