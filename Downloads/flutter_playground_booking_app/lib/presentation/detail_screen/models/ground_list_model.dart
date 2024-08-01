// class GroundListModel {
//   String? image;
//   String? title;
//   String? time;

//   GroundListModel(this.image, this.title, this.time);
// }

class GroundListModel {
  String? image;
  String? title;
  String? time;

  GroundListModel(this.image, this.title, this.time);

  factory GroundListModel.fromJson(Map<String, dynamic> json) {
    return GroundListModel(
      json['ground_image'],
      json['ground_name'],
      json['time'],
    );
  }
}
