// class FootBallModel {
//   final int id;
//   final String title;
//   final int image;
//   final String location;
//   // String? image;
//   // String? title;
//   // String? location;
//   // String? distance;
//   // FootBallModel(this.image, this.title, this.location , this.distance)

//   FootBallModel(
//       {required this.id,
//       required this.title,
//       required this.image,
//       required this.location});

//     factory FootBallModel.fromJson(Map<String, dynamic> json) {
//       return FootBallModel(
//         id: json['id'], 
//         title: json['title']['rendered'], 
//         image: json['acf']['truf_image'], 
//         location: json['location']);
//     }
// }
// class FootBallModel {
//   int? id;
//   String? title;
//   int? turfImage;
//   String? address;
//   String? description;
//   String? price;
//   String? googleLocationUrl;

//   FootBallModel({
//     this.id,
//     this.title,
//     this.turfImage,
//     this.address,
//     this.description,
//     this.price,
//     this.googleLocationUrl,
//   });

//   factory FootBallModel.fromJson(Map<String, dynamic> json) {
//     return FootBallModel(
//       id: json['id'],
//       title: json['title']['rendered'],
//       turfImage: json['acf']['turf_image'],
//       address: json['acf']['address'],
//       description: json['acf']['description'],
//       price: json['acf']['price'],
//       googleLocationUrl: json['acf']['google_location_url'],
//     );
//   }
// }


class FootBallModel {
  int? id;
  String? title;
  String? turfImage;
  String? address;
  String? description;
  String? price;
  String? googleLocationUrl;

  FootBallModel({
    this.id,
    this.title,
    this.turfImage,
    this.address,
    this.description,
    this.price,
    this.googleLocationUrl,
  });

  factory FootBallModel.fromJson(Map<String, dynamic> json) {
    return FootBallModel(
      id: json['id'] as int?,
      title: json['title']['rendered'] as String?,
      turfImage: json['acf']['turf_image'] as String?,
      address: json['acf']['address'] as String?,
      description: json['acf']['description'] as String?,
      price: json['acf']['price'] as String?,
      googleLocationUrl: json['acf']['google_location_url'] as String?,
    );
  }
}
