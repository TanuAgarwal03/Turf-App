import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/presentation/search_screen/models/search_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:http/http.dart' as http;

class SearchControllers extends GetxController {
  TextEditingController searchController = TextEditingController();
  ApiService apiService = ApiService();
  List<TurfModel> allTurfs = [];
  List<TurfModel> filteredTurfs = [];
  List<SearchModel> searchModelList = [];

  @override
  void onInit() {
    super.onInit();
    fetchAllTurfs();
  }

   fetchAllTurfs() async {
    // const url = 'https://lytechxagency.website/turf/wp-json/wp/v2/turf?&acf_format=standard';

    try {
      final response = await apiService.getApi('turf?&acf_format=standard');
      // final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        allTurfs = data.map((item) => TurfModel.fromJson(item)).toList();
        filteredTurfs = allTurfs;
        update();
      } else {
        print('Failed to load turfs: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching turfs: $e');
    }
  }

  void searchTurfs(String query) {
    if (query.isEmpty) {
      filteredTurfs = allTurfs;
    } else {
      filteredTurfs = allTurfs.where((turf) {
        return turf.title.toLowerCase().contains(query.toLowerCase()) ||
               turf.address.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.clear();
  }
}
class TurfModel {
  final int id;
  final List<int> categories;
  final String turfImage;
  final String address;
  final String title;
  final String description;
  final String price;
  final String googleLocationUrl;
  final List<String> facilities;

  TurfModel({
    required this.id,
    required this.categories,
    required this.turfImage,
    required this.address,
    required this.description,
    required this.price,
    required this.googleLocationUrl,
    required this.facilities,
    required this.title,
  });

  factory TurfModel.fromJson(Map<String, dynamic> json) {
    return TurfModel(
      id: json['id'],
      title: json['title']['rendered'],
      categories: List<int>.from(json['categories']),
      turfImage: json['acf']['turf_image'],
      address: json['acf']['address'],
      description: json['acf']['description'],
      price: json['acf']['price'],
      googleLocationUrl: json['acf']['google_location_url'],
      facilities: (json['acf']['facilities'] as List)
          .map((facility) => facility['list_of_aminities'] as String)
          .toList(),
    );
  }
}
