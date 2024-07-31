import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

import '../models/detail_model.dart';
import '../models/detailscreen_item_model.dart';
import '../models/ground_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

class DetailController extends GetxController {
  
final Rx<DetailModel> detailModel = DetailModel(
    id: 0,
    title: '',
    description: '',
    image: '',
    address: '',
    price: '',
    locationUrl: '',
    facilities: [],
    reviews: [],
  ).obs;

  final RxList<DetailscreenItemModel> facilityList = <DetailscreenItemModel>[].obs;
  final RxList<GroundListModel> groundList = <GroundListModel>[].obs;

  PageController pageController = PageController();
  int currentPage = 0;
  int currentGround = 0;
  @override
  void onInit() {
    super.onInit();
    fetchTurfData();
  }
  Future<void> fetchTurfData() async {
  final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/18'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    detailModel.value = DetailModel.fromJson(data);
    
    facilityList.value = DetailscreenItemModel.fromFacilities(detailModel.value.facilities);
    
  } else {
    Get.snackbar("Error", "Failed to load data");
  }
}


  // Future<void> fetchTurfData() async {
  //   final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/18'));

  //   if (response.statusCode == 200) {
  //     detailModel.value = DetailModel.fromJson(jsonDecode(response.body));
  //     print(response.body);
  //     facilityList.value = DetailscreenItemModel.fromFacilities(detailModel.value.facilities);
   

  //   //    List<GroundListModel> updatedGroundList = (data['ground_list'] as List)
  //   //   .map((ground) => GroundListModel.fromJson(ground))
  //   //   .toList();

  //   // groundList.value = updatedGroundList;
  //   } else {
  //     Get.snackbar("Error", "Failed to load data");
  //   }
  // }

}
