class PopularGroundModel {
  int? id;
  String? title;
  String? image;
  String? location;
  String? description;
  String? price;

  PopularGroundModel({
    this.id,
    this.title,
    this.image,
    this.location,
    this.description,
    this.price,
  });

  factory PopularGroundModel.fromJson(Map<String, dynamic> json) {
    return PopularGroundModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      location: json['address'],
      description: json['description'],
      price: json['price'],
    );
  }
}
