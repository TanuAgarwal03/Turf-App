import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_playground_booking_app/config/app_config.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/presentation/add_ground_screen/models/add_ground_model.dart';
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

  Future<void> createGround() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int user_id = prefs.getInt('user_id') ?? 4;
    final response = await apiService.postAPI(
      'create-turf?title=${titleController.text}&description=${descriptionController.text}&image=${imageController.text}&address=${locationController.text}&price=${priceController.text}&facilities=${facilitiesController.text}&user_id=$user_id&post_category=$selectedCategoryId&google_location_url=$googleLocationUrlController.text',
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
        // 'list_of_ground': formattedGroundList,
        // ...formattedGroundList,
        // 'list_of_ground' : (json['list_of_ground'] as List)
        //   .map((item) => Ground.fromJson(item))
        //   .toList(),
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
    // groundImageController.dispose();
    // groundNameController.dispose();
    // groundTimeController.dispose();
  }
}



  // TextEditingController groundNameController = TextEditingController();
  // TextEditingController groundTimeController = TextEditingController();
  // TextEditingController groundImageController = TextEditingController();
  // List<Map<String, dynamic>> listOfGrounds = [];
  // Rx<AddGroundModel> addGroundModelObj = AddGroundModel(listofGrounds: []).obs;


    // Map<String, dynamic> formattedGroundList = {};
    // for (int i = 0; i < listOfGrounds.length; i++) {
    //   formattedGroundList['list_of_ground[$i][ground_name]'] = listOfGrounds[i]['ground_name'];
    //   formattedGroundList['list_of_ground[$i][time]'] = listOfGrounds[i]['time'];
    //   formattedGroundList['list_of_ground[$i][ground_image]'] = listOfGrounds[i]['ground_image'];
    // }
    // if (addGroundModelObj.value.listofGrounds.isEmpty) {
    //   Get.snackbar('Error', 'Please add at least one ground');
    //   return;
    // }

    // Format list_of_ground parameters
    // List<Map<String, dynamic>> formattedGroundList = [];
    // for (int i = 0; i < addGroundModelObj.value.listofGrounds.length; i++) {
    //   formattedGroundList.add({
    //     'ground_name': addGroundModelObj.value.listofGrounds[i]['ground_name'],
    //     'time': addGroundModelObj.value.listofGrounds[i]['time'],
    //     'ground_image': addGroundModelObj.value.listofGrounds[i]['ground_image'],
    //   });
    // }
    
  // print(' list : $listOfGrounds');
  // print('formatted list : $formattedGroundList');