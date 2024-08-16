class ReviewItemModel {
  String id;
  String? title;
  String rating;
  String? description;
  String? firstName;
  String? lastName;
  String? status;

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
      title: json['title'] ?? '',
      rating: json['rating'].toString(),
      description: json['discription'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
