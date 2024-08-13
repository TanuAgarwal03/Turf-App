import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/detail_model.dart';
import '../models/detailscreen_item_model.dart';
import '../models/ground_list_model.dart';
import 'package:get/get.dart';
import 'dart:convert';

class DetailController extends GetxController {
  var isLoading = true.obs;
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

  final RxList<DetailscreenItemModel> facilityList =
      <DetailscreenItemModel>[].obs;
  final RxList<GroundListModel> groundList = <GroundListModel>[].obs;
  ApiService apiService = ApiService();

  PageController pageController = PageController();
  int currentPage = 0;
  int currentGround = 0;
  @override
  void onInit() {
    super.onInit();
    _loadTurfId();
  }

  Future<void> _loadTurfId() async {
    final prefs = await SharedPreferences.getInstance();
    final turfId = prefs.getInt('selectedTurfId') ?? 0;
    if (turfId != 0) {
      fetchTurfData(turfId);
      print("turf id from SharedPreferences : $turfId");
    } else {
      Get.snackbar("Error", "No turf ID found");
    }
  }

  Future<void> fetchTurfData(int turfId) async {
    try {
      isLoading(true);
      final response = await apiService.getAPI('get-turf/$turfId');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(' Detail page loading for $turfId');
        isLoading(false);
        if (data is Map<String, dynamic>) {
          detailModel.value = DetailModel.fromJson(data);
          facilityList.value = DetailscreenItemModel.fromFacilities(
              detailModel.value.facilities);
        } else {
          print('Unexpected data format');
        }
      } else {
        isLoading(false);
        Get.snackbar('Error', 'Failed to load turf details !');
        isLoading(false);
      }
    } catch (e) {
      print('Exception $e');
    } finally {
      isLoading(false);
    }
  }
}
