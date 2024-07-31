/// This class defines the variables used in the [write_a_review_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// class WriteAReviewModel { }
class WriteAReviewModel {
  String? userId;
  // String? postId;
  // String? rating;
  String? description;

  WriteAReviewModel({this.userId, this.description});

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      // 'post_id': postId,
      // 'rating': rating,
      'description': description,
    };
  }
}
