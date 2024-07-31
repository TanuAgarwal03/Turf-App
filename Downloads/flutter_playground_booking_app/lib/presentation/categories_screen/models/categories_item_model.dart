// import 'dart:ui';

// /// This class is used in the [categories_item_widget] screen.

// class CategoriesItemModel {

//   String? icon;
//   String? title;
//   Color? bgColor;
//   CategoriesItemModel(this.icon, this.title, this.bgColor);
// }
// import 'dart:convert';
// import 'package:flutter/material.dart';

// class CategoriesItemModel {
//   String? icon;
//   String? title;
//   Color? bgColor;

// CategoriesItemModel(String imgSoccer11, String s, Color footBollColor, {
//     this.icon,
//     this.title,
//     this.bgColor,
//   });
//   factory CategoriesItemModel.fromJson(Map<String, dynamic> json) {
//     return CategoriesItemModel(
//       icon: json['icon'] ?? '',  // Adjust according to the API response
//       title: json['title']['rendered'] ?? '',  // Adjust according to the API response
//       bgColor: Colors.transparent,  // You may need to handle color differently
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';

class CategoriesItemModel {
  String? id; 
  String? icon;
  String? title;
  Color? bgColor;

  CategoriesItemModel({
    this.id,
    required this.icon,
    required this.title,
    required this.bgColor,
  });

  factory CategoriesItemModel.fromJson(Map<String, dynamic> json) {
    return CategoriesItemModel(
      id: json['id']?.toString(),
      icon: json['icon'] ?? '', // Adjust according to the API response
      // icon: 'assets/images/${json['icon']}',
      title: json['name'] ?? '', // Adjust according to the API response
      bgColor: Colors.transparent, // Handle color as needed
      // icon:_getIconFromTitle(json['name'] ?? ''),
    );
  }



  // static String _getIconFromTitle(String title) {
  //   switch (title.toLowerCase()) {
  //     case 'Badminton':
  //       return 'assets/images/img_ellipse_225.png';
  //     case 'tennis':
  //       return 'assets/images/tennis.png';
  //     case 'basketball':
  //       return 'assets/images/basketball.png';
  //     case 'volleyball':
  //       return 'assets/images/volleyball.png';
  //     case 'cricket':
  //       return 'assets/images/cricket.png';
  //     case 'kabaddi':
  //       return 'assets/images/kabaddi.png';
  //     default:
  //       return 'assets/images/default.png';
  //   }
  // }
}
