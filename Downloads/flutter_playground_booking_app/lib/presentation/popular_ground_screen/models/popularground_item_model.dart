
class PopulargroundItemModel {
  String? image;
  String? title;
  String? location;
  bool? isBadminton;
  bool? isCricket;
  bool? isFootball;

  PopulargroundItemModel({
    this.image,
    this.title,
    this.location,
    this.isBadminton,
    this.isCricket,
    this.isFootball,
  });

  factory PopulargroundItemModel.fromJson(Map<String, dynamic> json) {
    List<String> facilities = List<String>.from([
        json['facilities_0_list_of_aminities'],
        json['facilities_1_list_of_aminities'],
        json['facilities_2_list_of_aminities'],
        json['facilities_3_list_of_aminities']
      ].where((element) => element != null && element.isNotEmpty));
    return PopulargroundItemModel(
      image: json['turf_image'],
      title: json['title']['rendered'],
      location: json['location'],
      isBadminton: facilities.contains('badminton'),
      isCricket: facilities.contains('cricket'),
      isFootball: facilities.contains('football'),
    );
  }
}
