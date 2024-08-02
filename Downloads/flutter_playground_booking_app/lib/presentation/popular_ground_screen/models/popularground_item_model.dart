class PopulargroundItemModel {
  int? id;
  String? title;
  String? image;
  String? location;
  String? description;
  String? price;

  PopulargroundItemModel({
    this.id,
    this.title,
    this.image,
    this.location,
    this.description,
    this.price,
  });

  factory PopulargroundItemModel.fromJson(Map<String, dynamic> json) {
    return PopulargroundItemModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      location: json['address'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'address': location,
      'description': description,
      'price': price,
    };
  }
}