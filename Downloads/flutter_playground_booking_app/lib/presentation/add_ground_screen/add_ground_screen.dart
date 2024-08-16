// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_drop_down_field.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'controller/add_ground_controller.dart';
import 'package:http/http.dart' as http;

class AddGroundScreen extends StatefulWidget {
  const AddGroundScreen({super.key});

  @override
  State<AddGroundScreen> createState() => _AddGroundScreenState();
}

class _AddGroundScreenState extends State<AddGroundScreen> {
  AddGroundController controller = Get.put(AddGroundController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Map<String, dynamic>> listOfGrounds = [];
  late Future<List<dynamic>> _categoriesFuture;

  final AddGroundController addGroundController =
      Get.put(AddGroundController());
  var categories = [].obs;
  bool _isLoading = false;
  File? _selectedImage;

  List<String> facilities = [
    'Parking',
    'WiFi',
    'Washroom',
    'CCTV',
    'Canteen',
    'Changing room',
    'Lockers'
  ];

  List<String> selectedFacilities = [];
  List<String> uploadedImageUrls = [];
  List<int> galleryAttachmentIds = [];

  @override
  void initState() {
    super.initState();
    _categoriesFuture = controller.fetchCategories();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isLoading = true;
      });

      final request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://lytechxagency.website/turf/wp-json/wp/v1/upload-image'),
      );
      request.files
          .add(await http.MultipartFile.fromPath('file', _selectedImage!.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseBody);

        if (jsonResponse['attachment_id'] != null) {
          controller.imageController.text =
              jsonResponse['attachment_id'].toString();
          Get.snackbar('Success', 'Image uploaded successfully');
        } else {
          Get.snackbar('Error', 'Failed to upload image');
        }
      } else {
        Get.snackbar('Error', 'Server error');
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage(); // Select multiple images

    if (pickedFiles.isNotEmpty) {
      setState(() {
        _isLoading = true; // Show loader
      });

      List<int> newAttachmentIds = [];
      List<String> newImageUrls = [];

      for (var pickedFile in pickedFiles) {
        File imageFile = File(pickedFile.path);

        final request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://lytechxagency.website/turf/wp-json/wp/v1/upload-image'),
        );
        request.files
            .add(await http.MultipartFile.fromPath('file', imageFile.path));

        final response = await request.send();
        if (response.statusCode == 200) {
          final responseBody = await response.stream.bytesToString();
          final jsonResponse = jsonDecode(responseBody);

          final attachmentId = jsonResponse['attachment_id'];
          final imageUrl =
              jsonResponse['url']; // Adjust this if URL is in a different field
          if (attachmentId != null) {
            newAttachmentIds.add(attachmentId);
            newImageUrls.add(imageUrl);
            Get.snackbar('Success', 'Image uploaded successfully');
          } else {
            Get.snackbar('Error', 'Failed to upload image');
          }
        } else {
          Get.snackbar('Error', 'Failed to upload image');
        }
      }

      setState(() {
        galleryAttachmentIds.addAll(newAttachmentIds);
        uploadedImageUrls.addAll(newImageUrls);
        _isLoading = false; // Hide loader
      });
    } else {
      Get.snackbar('Error', 'No images selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
          backgroundColor: appTheme.bgColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: viewInsets.bottom),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCommonAppBar("lbl_add_ground".tr),
                          SizedBox(height: 25.v),
                          _buildMasterInput(),
                          SizedBox(height: 25.v),
                          _buildEmail(),
                          SizedBox(height: 25.v),
                          _buildMasterInput1(),
                          SizedBox(height: 25.v),
                          _buildMasterInput2(),
                          SizedBox(height: 25.v),
                          _buildGoogleLocationUrl(),
                          Padding(
                            padding: EdgeInsets.only(left: 25.h),
                            child: Text(
                              '*Note : Please enter google location url in the specified format : \n   https://www.google.com/maps/abc/@latitude,longitude/',
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          SizedBox(height: 25.v),
                          _buildMasterInput3(),
                          SizedBox(height: 25.v),
                          _categoryDropdown(),
                          SizedBox(height: 25.v),
                          _uploadGalleryImages(),
                          SizedBox(height: 25.v),
                          // SizedBox(height: 25.v),
                          // _uploadGalleryImages(),
                          Center(
                            child: _uploadImage(),
                          ),
                          SizedBox(height: 25.v),
                          SizedBox(height: 5.v),
                        ]))),
          ),
          bottomNavigationBar: _buildButtons()),
    );
  }

  Widget groundList() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            Text('Ground List'),
            Row(
              children: [],
            )
          ],
        ));
  }

  /// Section Widget
  Widget _buildMasterInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
        controller: controller.titleController,
        hintText: "Title",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Title cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
        controller: controller.descriptionController,
        hintText: "Description",
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email address cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildMasterInput1() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
        controller: controller.priceController,
        hintText: "Price",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '*This field cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildMasterInput2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
        controller: controller.locationController,
        hintText: "Address",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '*Address of the turf is mandatory.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildGoogleLocationUrl() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
        controller: controller.googleLocationUrlController,
        hintText: "Google Location URL",
        textInputType: TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Location URL cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildMasterInput3() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Facilities",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 8.v),
          Wrap(
            spacing: 10.h,
            runSpacing: 10.v,
            children: facilities.map((facility) {
              return ChoiceChip(
                label: Text(facility),
                selected: selectedFacilities.contains(facility),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedFacilities.add(facility);
                    } else {
                      selectedFacilities.remove(facility);
                    }

                    controller.facilitiesController.text =
                        selectedFacilities.join(', ');
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _uploadImage() {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Image upload',
                content: Text('Choose the image from gallery'),
                cancel: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Back', style: TextStyle(color: Colors.white)),
                  ),
                ),
                onCancel: () => Get.back(),
                confirm: ElevatedButton(
                  onPressed: () {
                    _pickImage();
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child:
                        Text('Upload', style: TextStyle(color: Colors.white)),
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child:
                  Text('Upload Image', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 20),
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : Text('No image selected'),
        ],
      ),
    );
  }

  Widget _buildContinue() {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.h, right: 20.h, bottom: 32.v, top: 16.v),
      child: CustomElevatedButton(
          text: "lbl_continue".tr,
          onPressed: () {
            onTapContinue();
          }),
    );
  }

  Widget _buildButtons() {
    return Container(
        width: double.infinity,
        color: appTheme.bgColor,
        child: _buildContinue());
  }

  Widget _categoryDropdown() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: FutureBuilder<List<dynamic>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final categories = snapshot.data!;
            return CustomDropdownButtonFormField<int>(
              labelText: 'Select category',
              value: controller.selectedCategoryId,
              items: categories.map((category) {
                return DropdownMenuItem<int>(
                  value: category['id'],
                  child: Text(category['name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  controller.selectedCategoryId = value;
                  controller.selectedCategoryName = categories.firstWhere(
                      (category) => category['id'] == value)['name'];
                });
              },
            );
          } else {
            return Text('No categories available');
          }
        },
      ),
    );
  }

//   Widget _uploadGalleryImages() {
//   return Padding(
//     padding: EdgeInsets.all(25.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Upload Gallery Images',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: _pickImages,
//           child: Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 'Select Images',
//                 style: TextStyle(color: Colors.white),
//               )),
//         ),
//         SizedBox(height: 10),
//         Wrap(
//           spacing: 10,
//           runSpacing: 10,
//           children: uploadedImageUrls.isNotEmpty
//               ? uploadedImageUrls.map((url) {
//                   return Image.network(
//                     url,
//                     width: 100,
//                     height: 100,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Icon(Icons.error, color: Colors.red);
//                     },
//                   );
//                 }).toList()
//               : [Text('No images uploaded')],
//         ),
//       ],
//     ),
//   );
// }
  Widget _uploadGalleryImages() {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload Gallery Images',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _pickImages,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Select Images',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10),
          _isLoading
              ? Center(child: CircularProgressIndicator()) // Show loader
              : Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: uploadedImageUrls.isNotEmpty
                      ? uploadedImageUrls.map((url) {
                          return Image.network(
                            url,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error, color: Colors.red);
                            },
                          );
                        }).toList()
                      : [Text('No images uploaded')],
                ),
        ],
      ),
    );
  }

  onTapContinue() {
    if (_formKey.currentState!.validate()) {
      final galleryImages =
          uploadedImageUrls.map((url) => {'turf_images': url}).toList();
      print(' Gallery images in screen: $galleryImages');

      controller.createGround(galleryAttachmentIds);
      Get.back();
      Get.toNamed(
        AppRoutes.myGroundsScreen,
      );
    }
  }
}
