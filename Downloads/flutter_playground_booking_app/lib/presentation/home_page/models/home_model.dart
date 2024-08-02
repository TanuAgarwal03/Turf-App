// import 'package:flutter/widgets.dart';

// /// This class defines the variables used in the [home_page],
// /// and is typically used to hold data that is passed between different parts of the application.
// // class HomeModel { }

class UserModel{
  final String firstName;

  UserModel({
    required this.firstName,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
    };
  }
}

class HomeModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String location;
  final String price;
  final List<Facility> facilities;
  final List<Review> review;

  HomeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.location,
    required this.price,
    required this.facilities,
    required this.review,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      location: json['location'],
      price: json['price'],
      facilities: List<Facility>.from(
          json['facilities'].map((item) => Facility.fromJson(item))),
      review: List<Review>.from(
          json['review'].map((item) => Review.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'location': location,
      'price': price,
      'facilities': facilities.map((item) => item.toJson()).toList(),
      'review': review.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'HomeModel{id: $id, title: $title, description: $description, image: $image, location: $location, price: $price, facilities: $facilities, review: $review}';
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

  Map<String, dynamic> toJson() {
    return {
      'list_of_aminities': listOfAminities,
    };
  }

  @override
  String toString() {
    return 'Facility{listOfAminities: $listOfAminities}';
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

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'description': description,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Review{rating: $rating, description: $description, name: $name}';
  }
}
