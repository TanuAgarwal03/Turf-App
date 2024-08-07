/// This class defines the variables used in the [booking_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// class BookingDetailsModel {
//   String? image;
//   String? userName;
//   BookingDetailsModel(this.image, this.userName);
// }
class BookingDetailsModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String bookingDate;
  final String timeFrom;
  final String timeTo;
  // final String price;
  // final String turfName;
  // final String paymentStatus;

  BookingDetailsModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.bookingDate,
    required this.timeFrom,
    required this.timeTo,
    // required this.price,
    // required this.turfName,
    // required this.paymentStatus,
  });

  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookingDetailsModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      bookingDate: json['booking_date'],
      timeFrom: json['timefrom'],
      timeTo: json['timeto'],
      // turfName: json['turf_name'],
      // price: json['price'],
      // paymentStatus: json['payment_status'],
    );
  }
}
