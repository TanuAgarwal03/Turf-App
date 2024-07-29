// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/success_popup_screen/success_popup_screen.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_icon_button.dart';
import 'package:image_picker/image_picker.dart';
import 'controller/add_photos_controller.dart';
import 'models/addphotos_item_model.dart';

class AddPhotosScreen extends StatefulWidget {
  const AddPhotosScreen({super.key});

  @override
  State<AddPhotosScreen> createState() => _AddPhotosScreenState();
}

class _AddPhotosScreenState extends State<AddPhotosScreen> {
  AddPhotosController addPhotosController = Get.put(AddPhotosController());
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async{
        Get.back();
        return true;
      },
      child: Scaffold(
          backgroundColor: appTheme.bgColor,
          body: SafeArea(
            child: GetBuilder<AddPhotosController>(
              init: AddPhotosController(),
              builder:(controller) =>  Column(children: [
                getCommonAppBar("lbl_add_photos".tr),
                SizedBox(height: 16.v),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: GestureDetector(
                            onTap: () async {
                              XFile? file =
                              await picker.pickImage(source: ImageSource.camera);
                              controller.getImageList.add(AddphotosItemModel(file, false));
                             controller.update();
                            },
                            child: _buildCaption(ImageConstant.imgCameraIcon,
                                caption: "lbl_take_new_photo".tr))),
                    SizedBox(width: 16.h),
                    Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            XFile? file = await picker.pickImage(source: ImageSource.gallery);
                            controller.getImageList.add(AddphotosItemModel(file!, false));
                            controller.update();
                          },
                          child: _buildCaption(ImageConstant.imgIcImage,
                              caption: "msg_from_photo_album".tr),
                        ))
                  ]),
                ),
                SizedBox(height: 24.v),
                // _buildAddPhotos(),
                controller.getImageList.isNotEmpty
                    ? GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: controller.getImageList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 121.v,
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.h,
                            crossAxisSpacing: 8.h),
                        itemBuilder: (context, index) {
                          AddphotosItemModel data = controller.getImageList[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(index==3?0:16.h),
                              topRight: Radius.circular(index==2?0:16.h),
                              bottomLeft: Radius.circular(index==1?0:16.h),
                              bottomRight: Radius.circular(index==0?0:16.h),
                            ),
                                image: DecorationImage(
                                    image: FileImage(File(data.image!.path)),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: [
                              ],
                            ),
                          );
                        },
                      )
                    : SizedBox(),
              ]),
            ),
          ),
          bottomNavigationBar: _buildButtons()),
    );
  }


  /// Section Widget
  // Widget _buildFrame() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20.h),
  //     child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //       Expanded(
  //           child: GestureDetector(
  //               onTap: () async {
  //                 XFile? file =
  //                     await picker.pickImage(source: ImageSource.camera);
  //                 setState(() {
  //                   _image!.add(file!);
  //                 });
  //               },
  //               child: _buildCaption(ImageConstant.imgCameraIcon,
  //                   caption: "lbl_take_new_photo".tr))),
  //       SizedBox(width: 16.h),
  //       Expanded(
  //           child: GestureDetector(
  //         onTap: () async {
  //           XFile? file = await picker.pickImage(source: ImageSource.gallery);
  //           setState(() {
  //             _image!.add(file!);
  //           });
  //         },
  //         child: _buildCaption(ImageConstant.imgIcImage,
  //             caption: "msg_from_photo_album".tr),
  //       ))
  //     ]),
  //   );
  // }

  /// Section Widget
  // Widget _buildAddPhotos() {
  //   return Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 20.h),
  //       child: Obx(() => GridView.builder(
  //           shrinkWrap: true,
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               mainAxisExtent: 121.v,
  //               crossAxisCount: 2,
  //               mainAxisSpacing: 8.h,
  //               crossAxisSpacing: 8.h),
  //           physics: NeverScrollableScrollPhysics(),
  //           itemCount: controller
  //               .addPhotosModelObj.value.addphotosItemList.value.length,
  //           itemBuilder: (context, index) {
  //             AddphotosItemModel model = controller
  //                 .addPhotosModelObj.value.addphotosItemList.value[index];
  //             return AddphotosItemWidget(model);
  //           })));
  // }

  /// Section Widget
  Widget _buildButtons() {
    return Container(
        width: double.maxFinite,
        color: appTheme.bgColor,
        child: Padding(
          padding:
              EdgeInsets.only(left: 20.h, right: 20.h, bottom: 32.v, top: 16.v),
          child: CustomElevatedButton(
              text: "lbl_confirm".tr,
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        insetPadding: EdgeInsets.all(16.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.h)),
                        contentPadding: EdgeInsets.zero,
                        content: SuccessPopupScreen());
                  },
                );
              }),
        ));
  }

  /// Common widget
  Widget _buildCaption(icon, {required String caption}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 14.v),
        decoration: AppDecoration.fillGray.copyWith(
            color: appTheme.textfieldFillColor,
            borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 48.adaptSize,
              width: 48.adaptSize,
              padding: EdgeInsets.all(12.h),
              decoration: IconButtonStyleHelper.fillPrimaryContainerTL24,
              child: CustomImageView(color: appTheme.black900, imagePath: icon
                  // ImageConstant.imgIcImage

                  )),
          SizedBox(height: 15.v),
          Text(caption,
              style: CustomTextStyles.bodyLargeOnPrimary
                  .copyWith(color: appTheme.black900))
        ]));
  }

  /// Navigates to the groundCategoryScreen when the action is triggered.
  onTapAddPhotos() {
    Get.toNamed(
      AppRoutes.groundCategoryScreen,
    );
  }

  /// Navigates to the successPopupScreen when the action is triggered.
  onTapConfirm() {
    Get.toNamed(
      AppRoutes.successPopupScreen,
    );
  }
}
