import '../../../core/app_export.dart';
import 'categories_item_model.dart';

/// This class defines the variables used in the [categories_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CategoriesModel {


  static List<CategoriesItemModel> categoriesItemList(){
    return [
      CategoriesItemModel(ImageConstant.imgSoccer11, "Foot ball",appTheme.footBollColor),
      CategoriesItemModel(ImageConstant.imgBall1, "Tenis",appTheme.tenisColor),
      CategoriesItemModel(ImageConstant.imgBasketball1, "Basket ball",appTheme.basketBollColor),
      CategoriesItemModel(ImageConstant.imgVolleyBall1, "Volly ball",appTheme.vollyBollColor),
      CategoriesItemModel(ImageConstant.imgCricket1, "Cricket",appTheme.cricketColor),
      CategoriesItemModel(ImageConstant.imgKabaddiCourt1, "kabaddi",appTheme.kabbadiColor),
      CategoriesItemModel(ImageConstant.imgBadminton1, "Badminton",appTheme.bedmintanColor),
      CategoriesItemModel(ImageConstant.imgGolfStick1, "Golf",appTheme.golfColor),
      CategoriesItemModel(ImageConstant.imgTarget1, "Archery",appTheme.archeyColor),
      CategoriesItemModel(ImageConstant.imgBall11, "Baseball",appTheme.baseballColor),
      CategoriesItemModel(ImageConstant.imgBiathlonist1, "Biathlon",appTheme.bithalonColor),
      CategoriesItemModel(ImageConstant.imgGun1, "Shooting ",appTheme.shotingColor),

    ];
  }

}
