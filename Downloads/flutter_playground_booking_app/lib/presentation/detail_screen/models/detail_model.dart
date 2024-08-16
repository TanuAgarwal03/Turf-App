import 'detailscreen_item_model.dart';

class DetailModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String address;
  final String price;
  final String locationUrl;
  final List<Facility> facilities;
  final List<Review> reviews;
  final List<String> galleryImages;
  // List<Gallery>? images;

  DetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.address,
    required this.price,
    required this.locationUrl,
    required this.facilities,
    required this.reviews,
    required this.galleryImages,
    // this.images,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    var facilitiesJson = json['facilities'] as List;
    var reviewsJson = json['review'] as List;
    var galleryJson = json['gallery'] as List? ?? [];

    return DetailModel(
      id: json['id'] as int,
      title: json['title'],
      description: json['description'],
      image: json['image'],
      address: json['address'],
      price: json['price'],
      locationUrl: json['location_url'],
      facilities: facilitiesJson.map((e) => Facility.fromJson(e)).toList(),
      reviews: reviewsJson.map((e) => Review.fromJson(e)).toList(),
      galleryImages: galleryJson.map((e) => e['turf_images'] as String).toList()
    );
  }

  static List<DetailscreenItemModel> getFacilityList() {
    return [
    ];
  }

}

class Facility {
  final String listOfAminities;

  Facility({required this.listOfAminities});

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      listOfAminities: json['list_of_aminities'],
    );
  }
}
// class Gallery {
//   final String images;
//   Gallery({required this.images});
//   factory Gallery.fromJson(Map<String , dynamic> json) {
//     return Gallery(images: json['gallery']);
//   }

// }

class Review {
  final String rating;
  final String description;
  final String name;

  Review({
    required this.rating,
    required this.description,
    required this.name,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      description: json['discription'],
      name: json['name'],
    );
  }
}
