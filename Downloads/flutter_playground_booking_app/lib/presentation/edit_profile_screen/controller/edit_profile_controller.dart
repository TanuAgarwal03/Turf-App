import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// class EditProfileController extends GetxController {
//   final masterInputController = TextEditingController();
//   final masterInputController1 = TextEditingController();
//   final emailController = TextEditingController();
//   final profilePicUrl = RxString('');
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserData();
//   }

// Future<void> pickImage() async {
//   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     File imageFile = File(pickedFile.path);

//     try {
//       var uri = Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/upload-image');
//       var request = http.MultipartRequest('POST', uri)
//         ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

//       var response = await request.send();
//       if (response.statusCode == 200) {
//         final responseData = await response.stream.bytesToString();
//         final uploadData = json.decode(responseData);
//         profilePicUrl.value = uploadData['attachment_id'].toString(); 
//       } else {
//         print('Failed to upload image');
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }
// }

//   Future fetchUserData() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       int userId = prefs.getInt('user_id')?? 12;
//       final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_user_details/?user_id=$userId'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print(data);
//         if (data['status'] == 200) {
//           masterInputController.text = data['first_name'];
//           masterInputController1.text = data['last_name'];
//           emailController.text = data['email'];
//           profilePicUrl.value = data['profile_pic'];
//         }
//       } else {
//         print('Failed to load user data');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }


//   void updateUserDetails() async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//       int userId = prefs.getInt('user_id')?? 12;
//     final user_Id =  userId.toString();
//     final firstName = masterInputController.text;
//     final lastName = masterInputController1.text;
//     final email = emailController.text;
//     final profilePic = profilePicUrl.value;

//     try {
//       final response = await http.post(
//         Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/update_user_details/?user_id=$user_Id&first_name=$firstName&last_name=$lastName&profile_pic=$profilePic&email=$email'),
//         headers: {
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: {
//           'user_id': user_Id,
//           'first_name': firstName,
//           'last_name': lastName,
//           'email': email,
//           'profile_pic': profilePic,
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         if (data['status'] == 200) {
//           print('User details updated successfully');
//           Get.back();
//         } else {
//           print('Failed to update user details');
//         }
//       } else {
//         print('Failed to update user details');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
  
//   }
// }
class EditProfileController extends GetxController {
  final masterInputController = TextEditingController();
  final masterInputController1 = TextEditingController();
  final emailController = TextEditingController();
  final profilePicUrl = RxString('');
  final ImagePicker _picker = ImagePicker();
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    // pickImage();
    fetchUserData();
  }

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      try {
        var uri = Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/upload-image');
        var request = http.MultipartRequest('POST', uri)
          ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

        var response = await request.send();
        if (response.statusCode == 200) {
          final responseData = await response.stream.bytesToString();
          final uploadData = json.decode(responseData);
          profilePicUrl.value = uploadData['attachment_id'].toString();
          print(profilePicUrl.value);
          update(); 
        } else {
          print('Failed to upload image');
        }
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  Future fetchUserData() async {
    isLoading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('user_id') ?? 12;
      final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get_user_details/?user_id=$userId'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        if (data['status'] == 200) {
          masterInputController.text = data['first_name'];
          masterInputController1.text = data['last_name'];
          emailController.text = data['email'];
          profilePicUrl.value = data['profile_pic'];
        }
      } else {
        print('Failed to load user data');
      }
    } catch (e) {
      print('Error: $e');
    }finally {
      isLoading.value = false; // Set loading to false when done
    }

  }

  void updateUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('user_id') ?? 12;
    final user_Id = userId.toString();
    final firstName = masterInputController.text;
    final lastName = masterInputController1.text;
    final email = emailController.text;
    final profilePic = profilePicUrl.value;

    try {
      final response = await http.post(
        Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/update_user_details/?user_id=$user_Id'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'profile_pic': profilePic,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 200) {
          print('User details updated successfully');
          Get.back();
        } else {
          print('Failed to update user details');
        }
      } else {
        print('Failed to update user details');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
