// class PopulargroundItemModel {
//   int? id;
//   String? title;
//   String? image;
//   String? location;
//   String? description;
//   String? price;

//   PopulargroundItemModel({
//     this.id,
//     this.title,
//     this.image,
//     this.location,
//     this.description,
//     this.price,
//   });

//   factory PopulargroundItemModel.fromJson(Map<String, dynamic> json) {
//     return PopulargroundItemModel(
//       id: json['id'] as int?,
//       title: json['title'] as String?,
//       image: json['image'] as String?,
//       location: json['address'] as String?,
//       description: json['description'] as String?,
//       price: json['price'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'image': image,
//       'address': location,
//       'description': description,
//       'price': price,
//     };
//   }
// }

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
  print('Parsing JSON: $json');
  final acf = json['acf'];
  print('ACF data: $acf');
  return PopulargroundItemModel(
    id: json['id'] as int?,
    title: json['title'] is Map ? json['title']['rendered'] as String? : json['title'] as String?,
    image: acf is Map ? acf['turf_image'] as String? : null,
    location: acf is Map ? acf['address'] as String? : null,
    description: acf is Map ? acf['description'] as String? : null,
    price: acf is Map ? acf['price'] as String? : null,
  );
}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'acf': {
        'turf_image': image,
        'address': location,
        'description': description,
        'price': price,
      },
    };
  }
}

