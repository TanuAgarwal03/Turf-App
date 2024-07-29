import '../../../core/app_export.dart';
import 'review_item_model.dart';

/// This class defines the variables used in the [review_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ReviewModel {


  static List<ReviewItemModel> getReviewList(){
    return [
      ReviewItemModel(ImageConstant.imgEllipse15240x40,"Floyd Miles","2min ago","3.0","Qorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus."),
      ReviewItemModel(ImageConstant.imgEllipse1521,"Wade Warren","20min ago","4.0","QIt is a long established fact that a reader will be distracted by the readable content of a page."),
      ReviewItemModel(ImageConstant.imgEllipse1522,"Brooklyn Simmons","30min ago","4.5","There are many variations of passages of Lorem Ipsum available, but the majority have suffered."),
      ReviewItemModel(ImageConstant.imgEllipse1523,"Dianne Russell","40min ago","4.0","All the Lorem Ipsum generators on the Internet tend to on the Internet. It uses a dictionary."),
      ReviewItemModel(ImageConstant.imgEllipse1524,"Marvin McKinney","50min ago","3.5","It uses a dictionary of over 200 Latin words, combined with a handful."),
      ReviewItemModel(ImageConstant.imgEllipse1525,"Albert Flores","56min ago","4.0","Qorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus."),
    ];
  }



  // Rx<List<ReviewItemModel>> reviewItemList = Rx([
  //   ReviewItemModel(
  //       floydMiles: ImageConstant.imgEllipse15240x40.obs,
  //       floydMiles1: "Floyd Miles".obs,
  //       time: "2min ago".obs,
  //       fortyFive: "3.0".obs,
  //       timeZone:
  //           "Qorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus."
  //               .obs),
  //   ReviewItemModel(
  //       floydMiles: ImageConstant.imgEllipse1521.obs,
  //       floydMiles1: "Wade Warren".obs,
  //       time: "20min ago".obs,
  //       fortyFive: "4.0".obs,
  //       timeZone:
  //           "QIt is a long established fact that a reader will be distracted by the readable content of a page."
  //               .obs),
  //   ReviewItemModel(
  //       floydMiles: ImageConstant.imgEllipse1522.obs,
  //       floydMiles1: "Brooklyn Simmons".obs,
  //       time: "30min ago".obs,
  //       fortyFive: "4.5".obs,
  //       timeZone:
  //           "There are many variations of passages of Lorem Ipsum available, but the majority have suffered."
  //               .obs),
  //   ReviewItemModel(
  //       floydMiles: ImageConstant.imgEllipse1523.obs,
  //       floydMiles1: "Dianne Russell".obs,
  //       time: "40min ago".obs,
  //       fortyFive: "4.0".obs,
  //       timeZone:
  //           "All the Lorem Ipsum generators on the Internet tend to on the Internet. It uses a dictionary."
  //               .obs),
  //   ReviewItemModel(
  //       floydMiles: ImageConstant.imgEllipse1524.obs,
  //       floydMiles1: "Marvin McKinney".obs,
  //       time: "50min ago".obs,
  //       fortyFive: "3.5".obs,
  //       timeZone:
  //           "It uses a dictionary of over 200 Latin words, combined with a handful."
  //               .obs),
  //   ReviewItemModel(
  //       floydMiles: ImageConstant.imgEllipse1525.obs,
  //       floydMiles1: "Albert Flores".obs,
  //       time: "56min ago".obs,
  //       fortyFive: "4.0".obs,
  //       timeZone:
  //           "Qorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus."
  //               .obs)
  // ]);
}
