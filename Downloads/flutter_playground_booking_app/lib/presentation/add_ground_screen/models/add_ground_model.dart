
class AddGroundModel {
  String? title;
  String? description;
  String? image;
  String? address;
  String? price;
  String? facilities;
  String? category;
  String? googleLocationUrl;

  AddGroundModel({
    this.title,
    this.description,
    this.image,
    this.address,
    this.price,
    this.facilities,
    this.category,
    this.googleLocationUrl,
  });

  factory AddGroundModel.fromJson(Map<String, dynamic> json) {
    return AddGroundModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      address: json['address'],
      price: json['price'],
      facilities: json['facilities'],
      category: json['categories'],
      googleLocationUrl: json['google_location_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'address': address,
      'price': price,
      'facilities': facilities,
      'categories': category,
      'google_location_url' : googleLocationUrl,
    };
  }
}
