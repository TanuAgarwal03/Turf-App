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
  // final AddGroundModel addGroundModel = AddGroundModel(listofGrounds: []);
  final List<Map<String, dynamic>> listOfGrounds = [];
  final TextEditingController groundNameController = TextEditingController();
  final TextEditingController groundTimeController = TextEditingController();
  final TextEditingController groundImageController = TextEditingController();
  late Future<List<dynamic>> _categoriesFuture;

  // final CategoryController categoryController = Get.put(CategoryController());
  final AddGroundController addGroundController =
      Get.put(AddGroundController());
  var categories = [].obs;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = controller.fetchCategories();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
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
        print(jsonResponse['attachment_id']);
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
      Get.back();
    } else {
      Get.snackbar('Error', 'No image selected');
      Get.back();
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
                    // width: double.maxFinite,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                          _buildMasterInput3(),
                          SizedBox(height: 25.v),
                          _categoryDropdown(),
                          SizedBox(height: 25.v),
                          _buildGroundInput1(),
                          SizedBox(height: 25.v),
                          _buildGroundInput2(),
                          SizedBox(height: 25.v),
                          _buildGroundInput3(),
                          SizedBox(height: 25.v),
                          _buildAddGroundButton(),
                          _imageUpload(),
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
          controller: controller.titleController, hintText: "Title"),
    );
  }

  /// Section Widget
  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
        controller: controller.descriptionController,
        hintText: "Description",
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  /// Section Widget
  Widget _buildMasterInput1() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
          controller: controller.priceController, hintText: "Price."),
    );
  }

  /// Section Widget
  Widget _buildMasterInput2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
          controller: controller.locationController, hintText: "Location"),
    );
  }

  /// Section Widget
  Widget _buildMasterInput3() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
          controller: controller.facilitiesController,
          hintText: "Facilities",
          textInputAction: TextInputAction.done),
    );
  }

  ///ImageUpload Widget

  Widget _imageUpload() {
    return Padding(padding: EdgeInsets.all(10.0), child: FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 166, 190, 165),
      elevation: 10, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      tooltip: 'Add Turf Image',
        child: Icon(Icons.upload_file),
        onPressed: () => Get.defaultDialog(
            title: 'Image upload',
            content: Text('Choose the image from gallery'),
            cancel: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ))),
            onCancel: () => Get.back(),
            confirm: ElevatedButton(
                onPressed: () {
                  _pickImage();
                },
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Upload',
                      style: TextStyle(color: Colors.white),
                    ))))));
  }

  // Widget _imageUpload1() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20.h),
  //     child: ElevatedButton(
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //           child: Text(
  //             'Upload Image',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //         onPressed: () => Get.defaultDialog(
  //             title: 'Image upload',
  //             content: Text('Choose the image from gallery'),
  //             cancel: ElevatedButton(
  //                 onPressed: () {
  //                   Get.back();
  //                 },
  //                 child: Padding(
  //                     padding: EdgeInsets.all(10.0),
  //                     child: Text(
  //                       'Back',
  //                       style: TextStyle(color: Colors.white),
  //                     ))),
  //             onCancel: () => Get.back(),
  //             confirm: ElevatedButton(
  //                 onPressed: () {
  //                   _pickImage();
  //                 },
  //                 child: Padding(
  //                     padding: EdgeInsets.all(10.0),
  //                     child: Text(
  //                       'Upload',
  //                       style: TextStyle(color: Colors.white),
  //                     ))))),
  //   );
  // }

  /// Section Widget
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

  /// Section Widget
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
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
  // Widget _categoryDropdown() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20.h),
  //     child: FutureBuilder<List<dynamic>>(
  //       future: controller.fetchCategories(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return CircularProgressIndicator();
  //         } else if (snapshot.hasError) {
  //           return Text('Error: ${snapshot.error}');
  //         } else {
  //           final categories = snapshot.data!;
  //           return CustomDropdownButtonFormField<int>(
  //             labelText: 'Select category',
  //             value: controller.selectedCategoryId,
  //             items: categories.map((category) {
  //               return DropdownMenuItem<int>(
  //                 value: category['id'],
  //                 child: Text(category['name']),
  //               );
  //             }).toList(),
  //             onChanged: (value) {
  //               setState(() {
  //                 controller.selectedCategoryId = value;
  //                 controller.selectedCategoryName = categories.firstWhere(
  //                     (category) => category['id'] == value)['name'];
  //               });
  //             },
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _buildGroundInput1() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
        controller: groundNameController,
        hintText: "Ground Name",
      ),
    );
  }

  Widget _buildGroundInput2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
        controller: groundTimeController,
        hintText: "Time",
      ),
    );
  }

  Widget _buildGroundInput3() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomTextFormField(
        controller: groundImageController,
        hintText: "Ground Image",
      ),
    );
  }

  // Widget _buildAddGroundButton() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20.h),
  //     child: CustomElevatedButton(
  //       text: "Add Ground",
  //       onPressed: () {
  //         setState(() {
  //           listOfGrounds.add({
  //             'ground_name': groundNameController.text,
  //             'time': groundTimeController.text,
  //             'ground_image': groundImageController.text,
  //           });
  //           controller.listOfGrounds = listOfGrounds; // Update the controller list
  //           print('Updated list of grounds : $listOfGrounds');
  //         });
  //         // Clear the fields after adding
  //         groundNameController.clear();
  //         groundTimeController.clear();
  //         groundImageController.clear();
  //       },
  //     ),
  //   );
  // }
  Widget _buildAddGroundButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomElevatedButton(
        text: "Add Ground",
        onPressed: () {
          setState(() {
            listOfGrounds.add({
              'ground_name': groundNameController.text,
              'time': groundTimeController.text,
              'ground_image': groundImageController.text, // Keep it as a String
            });
            controller.addGroundModelObj.update((model) {
              model?.listofGrounds =
                  List.from(listOfGrounds); // Update the list in the model
            });
            print('Updated list of grounds in view: $listOfGrounds');
            print(
                'Updated list of grounds in controller: ${controller.addGroundModelObj.value.listofGrounds}');
          });
          // Clear the fields after adding
          groundNameController.clear();
          groundTimeController.clear();
          groundImageController.clear();
        },
      ),
    );
  }

//   Widget _buildAddGroundButton() {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20.h),
//     child: CustomElevatedButton(
//       text: "Add Ground",
//       onPressed: () {
//         setState(() {
//           listOfGrounds.add({
//             'ground_name': groundNameController.text,
//             'time': groundTimeController.text,
//             'ground_image': int.tryParse(groundImageController.text) ?? 0,
//           });
//           controller.listOfGrounds = listOfGrounds; // Update the controller list
//           print('Updated list of grounds: $listOfGrounds');
//         });
//         // Clear the fields after adding
//         // groundNameController.clear();
//         // groundTimeController.clear();
//         // groundImageController.clear();
//       },
//     ),
//   );
// }
  onTapContinue() {
    controller.createGround();
    Get.toNamed(
      AppRoutes.myGroundsScreen,
    );
  }
}
