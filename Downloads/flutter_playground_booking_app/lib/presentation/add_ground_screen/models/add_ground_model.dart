
class AddGroundModel {
  String? title;
  String? description;
  String? image;
  String? address;
  String? price;
  String? facilities;
  String? category;
  List<Map<String , dynamic>> listofGrounds;

  AddGroundModel({
    this.title,
    this.description,
    this.image,
    this.address,
    this.price,
    this.facilities,
    this.category,
    required this.listofGrounds,
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
      listofGrounds: List<Map<String , dynamic>>.from(json['list_of_ground']),
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
      'list_of_ground' : listofGrounds,
    };
  }
}
