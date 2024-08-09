import 'package:flutter/material.dart';

String getAssetImagePath(String title) {
  switch (title) {
    case 'Badminton':
      return 'assets/images/img_badminton_1.svg';
    case 'Basketball':
      return 'assets/images/basketball_icon.svg';
      case 'Cricket':
      return 'assets/images/img_cricket_1.svg';
      case 'Football':
      return 'assets/images/img_soccer_1.svg';
      case 'Tennis':
      return 'assets/images/img_tennis_ball_1.svg';
      case 'VolleyBall':
      return 'assets/images/img_volley_ball_1.svg';
      case 'Kabaddi':
      return 'assets/images/img_kabaddi_court_1.svg';
      case 'Golf':
      return 'assets/images/img_golf_stick_1.svg';
      case 'Archery':
      return 'assets/images/img_basketball_1.svg';
      case 'Baseball':
      return 'assets/images/img_beachball_1.svg';
      case 'Biathlon':
      return 'assets/images/img_biathlonist_1.svg';
      case 'Shooting':
      return 'assets/images/img_gun_1.svg';
      case 'Swimming Pool':
      return 'assets/images/img_beachball_1.svg';
    default:
      return 'assets/images/img_avtar_1.svg';
  }
}

class CategoriesItemModel {
  int id; 
  String? icon;
  String? title;
  Color? bgColor;

  CategoriesItemModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.bgColor,
  });

  factory CategoriesItemModel.fromJson(Map<String, dynamic> json) {
    return CategoriesItemModel(
      id: json['id'],
      icon : getAssetImagePath(json['name']),
      title: json['name'] ?? '',
      bgColor: Colors.transparent,
    );
  }

}
