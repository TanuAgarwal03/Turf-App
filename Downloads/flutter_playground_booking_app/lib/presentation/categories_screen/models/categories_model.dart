// import '../../../core/app_export.dart';
// import 'categories_item_model.dart';

// /// This class defines the variables used in the [categories_screen],
// /// and is typically used to hold data that is passed between different parts of the application.
// class CategoriesModel {


//   static List<CategoriesItemModel> categoriesItemList(){
//     return [
//       CategoriesItemModel(icon: 'ImageConstant.imgSoccer11', title :"Foot ball",bgColor :appTheme.footBollColor),
//       CategoriesItemModel(icon:ImageConstant.imgBall1, title :"Tenis",bgColor :appTheme.tenisColor),
//       CategoriesItemModel(icon:ImageConstant.imgBasketball1, title :"Basket ball",bgColor :appTheme.basketBollColor),
//       CategoriesItemModel(icon:ImageConstant.imgVolleyBall1, title :"Volly ball",bgColor :appTheme.vollyBollColor),
//       CategoriesItemModel(icon:ImageConstant.imgCricket1, title :"Cricket",bgColor :appTheme.cricketColor),
//       CategoriesItemModel(icon:ImageConstant.imgKabaddiCourt1,title : "kabaddi",bgColor :appTheme.kabbadiColor),
//       // CategoriesItemModel(ImageConstant.imgBadminton1, "Badminton",appTheme.bedmintanColor),
//       // CategoriesItemModel(ImageConstant.imgGolfStick1, "Golf",appTheme.golfColor),
//       // CategoriesItemModel(ImageConstant.imgTarget1, "Archery",appTheme.archeyColor),
//       // CategoriesItemModel(ImageConstant.imgBall11, "Baseball",appTheme.baseballColor),
//       // CategoriesItemModel(ImageConstant.imgBiathlonist1, "Biathlon",appTheme.bithalonColor),
//       // CategoriesItemModel(ImageConstant.imgGun1, "Shooting ",appTheme.shotingColor),

//     ];
//   }

// }
// import 'dart:ui';
// import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/categories_screen/models/categories_item_model.dart';

class CategoriesModel {
  static List<CategoriesItemModel> categoriesItemList() {
    return [
      CategoriesItemModel(icon: 'assets/images/soccer_icon.png', title: "Football", bgColor: appTheme.footBollColor),
      CategoriesItemModel(icon: 'assets/images/tennis_icon.png', title: "Tennis", bgColor: appTheme.tenisColor),
      CategoriesItemModel(icon: 'assets/images/basketball_icon.png', title: "Basketball", bgColor: appTheme.basketBollColor),
      CategoriesItemModel(icon: 'assets/images/volleyball_icon.png', title: "Volleyball", bgColor: appTheme.vollyBollColor),
      CategoriesItemModel(icon: 'assets/images/cricket_icon.png', title: "Cricket", bgColor: appTheme.cricketColor),
      CategoriesItemModel(icon: 'assets/images/kabaddi_icon.png', title: "Kabaddi", bgColor: appTheme.kabbadiColor),
      CategoriesItemModel(icon:ImageConstant.imgBall1, title :"Tenis",bgColor :appTheme.tenisColor),
    ];
  }
}
