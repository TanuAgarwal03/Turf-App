import '../../../core/utils/image_constant.dart';
import 'my_booking_complated_model.dart';

class MyBookingCompletedData {
  static List<MyBookingComplatedModel> getMyBookingCompletedData() {
    return [
      MyBookingComplatedModel(ImageConstant.imgRectangle3951,
          "Since ground hocky", "Bangalore", "November 7, 2017"),
      MyBookingComplatedModel(ImageConstant.imgRectangle3957,
          "Vollyball ground", "Central", "November 7, 2017"),
      MyBookingComplatedModel(ImageConstant.imgRectangle3955, "Cricket ground",
          "Haiti", "December 19, 2013"),
      MyBookingComplatedModel(ImageConstant.imgRectangle3956,
          "Football ground ", "Bangalore", "March 23, 2013"),
      MyBookingComplatedModel(ImageConstant.imgRectangle3957,
          "Since ground hocky", "Greece", "November 7, 2017"),
      MyBookingComplatedModel(ImageConstant.imgRectangle3958, "Football ground",
          "Fairfield", "November 7, 2017"),
    ];
  }
}
