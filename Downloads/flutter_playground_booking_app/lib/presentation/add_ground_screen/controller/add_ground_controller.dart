import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddGroundController extends GetxController {
  ApiService apiService = ApiService();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController facilitiesController = TextEditingController();
  TextEditingController googleLocationUrlController = TextEditingController();
  int? selectedCategoryId;
  String? selectedCategoryName;
  var selectedImages = <String>[].obs;
  var imageAttachmentIds = <int>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<List<dynamic>> fetchCategories() async {
    print(facilitiesController.text);
    final response = await http.get(Uri.parse(
        'https://lytechxagency.website/turf/wp-json/wp/v2/categories'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> createGround(List<int> galleryIds) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int user_id = prefs.getInt('user_id') ?? 4;
    final galleryJson = jsonEncode(galleryIds);
    print('gallery in controller : $galleryJson');
    final response = await apiService.postAPI(
      'create-turf?title=${titleController.text}&description=${descriptionController.text}&image=${imageController.text}&address=${locationController.text}&price=${priceController.text}&facilities=${facilitiesController.text}&user_id=$user_id&post_category=$selectedCategoryId&google_location_url=${googleLocationUrlController.text}&gallery=$galleryJson',
      {
        'title': titleController.text,
        'description': descriptionController.text,
        'image': imageController.text,
        'address': locationController.text,
        'google_location_url' : googleLocationUrlController.text,
        'price': priceController.text,
        'facilities': facilitiesController.text,
        'user_id': user_id,
        'post_category': selectedCategoryId,
        'gallery' : galleryIds,
      },
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      if (responseBody['message'] == 'Turf created successfully') {
        print(response.body);
        Get.snackbar('Success', 'Turf created successfully');
      } else {
        Get.snackbar('Error', 'Failed to create turf');
      }
    } else {
      print(response.body);
      Get.snackbar('Error', 'Server error');
    }
  }

  @override
  void onClose() {
    super.onClose();
    titleController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    locationController.dispose();
    priceController.dispose();
    facilitiesController.dispose();
  }
}

