
// /// This class is used in the [review_item_widget] screen.

// // class ReviewItemModel {
// //   String? image;
// //   String? userName;
// //   String? time;
// //   String? noOfReview;
// //   String? reviewMSG;
// //   ReviewItemModel(
// //       this.image,
// //       this.userName,
// //       this.time,
// //       this.noOfReview,
// //       this.reviewMSG);
// // }
// class ReviewItemModel {
//   String? image;
//   String? userName;
//   String? time;
//   String? noOfReview;
//   String? reviewMSG;

//   ReviewItemModel({
//     this.image,
//     this.userName,
//     this.time,
//     this.noOfReview,
//     this.reviewMSG,
//   });

//   factory ReviewItemModel.fromJson(Map<String, dynamic> json) {
//     return ReviewItemModel(
//       image: json['image'],
//       userName: json['userName'],
//       time: json['time'],
//       noOfReview: json['noOfReview'],
//       reviewMSG: json['reviewMSG'],
//     );
//   }
// }
class ReviewItemModel {
  String id;
  String title;
  String rating;
  String description;
  String firstName;
  String lastName;
  String status;

  ReviewItemModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.description,
    required this.firstName,
    required this.lastName,
    required this.status,
  });

  factory ReviewItemModel.fromJson(Map<String, dynamic> json) {
    return ReviewItemModel(
      id: json['id'],
      title: json['title'],
      rating: json['rating'],
      description: json['discription'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      status: json['status'],
    );
  }
}
