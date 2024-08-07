/// This class defines the variables used in the [my_booking_upcoming_page],
/// and is typically used to hold data that is passed between different parts of the application.
// class MyBookingUpcomingModel {
//   String? image;
//   String? title;
//   String? location;
//   String? date;
//   MyBookingUpcomingModel(this.image, this.title, this.location, this.date);
// }
class MyBookingUpcomingModel {
  String id;
  String name;
  String phoneNumber;
  String turfName;
  String bookingDate;
  String price;
  String timeFrom;
  String timeTo;
  String paymentStatus;

  MyBookingUpcomingModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.turfName,
    required this.bookingDate,
    required this.price,
    required this.timeFrom,
    required this.timeTo,
    required this.paymentStatus,
  });

  factory MyBookingUpcomingModel.fromJson(Map<String, dynamic> json) {
    return MyBookingUpcomingModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      turfName: json['turf_name'],
      bookingDate: json['booking_date'],
      price: json['price'],
      timeFrom: json['timefrom'],
      timeTo: json['timeto'],
      paymentStatus: json['payment_status'],
    );
  }
}