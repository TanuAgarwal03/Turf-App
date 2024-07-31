import '../../../core/app_export.dart';
import 'detailscreen_item_model.dart';
import 'ground_list_model.dart';

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
    // final List<GroundListModel> groundList; // Add this line if groundList is part of the model

  DetailModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.address,
      required this.price,
      required this.locationUrl,
      required this.facilities,
      required this.reviews,
      // required this.groundList, // Add this line
      });


  factory DetailModel.fromJson(Map<String, dynamic> json) {
    var facilitiesJson = json['facilities'] as List;
    var reviewsJson = json['review'] as List;

    return DetailModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      address: json['address'],
      price: json['price'],
      locationUrl: json['location_url'],
      facilities: facilitiesJson.map((e) => Facility.fromJson(e)).toList(),
      reviews: reviewsJson.map((e) => Review.fromJson(e)).toList(),
      // groundList: (json['ground_list'] as List).map((item) => GroundListModel.fromJson(item)).toList(), // Update this
    );
  }

  static List<DetailscreenItemModel> getFacilityList() {
    return [
      DetailscreenItemModel(ImageConstant.imgParkingIcon, "Parking"),
      DetailscreenItemModel(ImageConstant.imgCameraIcon, "Camera"),
      DetailscreenItemModel(ImageConstant.imgWaaitingRoomIcon, "Waiting room"),
      DetailscreenItemModel(ImageConstant.imgChangingRoomIcon, "Change room"),
    ];
  }

  static List<GroundListModel> getGroundList() {
    return [
      GroundListModel(
          ImageConstant.imgRectangle3463281, "Main ground", "3 Hour"),
      GroundListModel(
          ImageConstant.imgRectangle3463281107x110, "Futsal Ground", "1 Hour"),
      GroundListModel(
          ImageConstant.imgRectangle34632811, "Tenis ground", "2 Hour"),
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
