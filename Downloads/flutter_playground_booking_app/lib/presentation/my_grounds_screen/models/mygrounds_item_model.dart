class MygroundsItemModel {
  String? image;
  String? title;
  String? time;
  String? description;
  String? location;
  String? price;
  List<Facility>? facilities;

  MygroundsItemModel({
    this.image,
    this.title,
    this.time,
    this.description,
    this.location,
    this.price,
    this.facilities,
  });

  factory MygroundsItemModel.fromJson(Map<String, dynamic> json) {
    return MygroundsItemModel(
      image: json['image'],
      title: json['title'],
      time: json['price'],
      description: json['description'],
      location: json['address'],
      price: json['price'],
      facilities: (json['facilities'] as List?)
          ?.map((facility) => Facility.fromJson(facility))
          .toList(),
    );
  }
}

class Facility {
  String? listOfAminities;

  Facility({this.listOfAminities});

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      listOfAminities: json['list_of_aminities'],
    );
  }
}
