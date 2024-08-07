// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:intl/intl.dart';
import '../detail_screen/controller/detail_controller.dart';
import 'controller/booking_details_one_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingDetailsOneScreen extends StatefulWidget {
  const BookingDetailsOneScreen({super.key});

  @override
  State<BookingDetailsOneScreen> createState() => _BookingDetailsOneScreenState();
}

class _BookingDetailsOneScreenState extends State<BookingDetailsOneScreen> {
  BookingDetailsOneController controller = Get.put(BookingDetailsOneController());
  DetailController detailController = Get.put(DetailController());

  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments as Map<String, dynamic>;
    final turfId = arguments['turfId'] as int?;

    if (turfId != null) {
      fetchTurfDetails(turfId);
    } else {
      Get.snackbar('Error', 'Turf ID is missing.');
    }
  }

  void fetchTurfDetails(int turfId) async {
    final response = await http.get(Uri.parse('https://lytechxagency.website/turf/wp-json/wp/v1/get-turf/$turfId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        controller.turfTitle.value = data['title'];
        controller.turfImage.value = data['image'];
        controller.turfAddress.value = data['address'];
        controller.turfId.value = data['id'];
      });
    } else {
      Get.snackbar('Error', 'Failed to fetch turf details.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final DateTime selectedDate = arguments['selectedDate'];
    final selectedTime = arguments['selectedTime'] as String;
    final name = arguments['name'] ?? 'tanu';
    final phoneNo = arguments['phoneNumber'] ?? '9874563210';

    final String formattedDate = DateFormat('dd MMM yyyy').format(selectedDate);
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
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCommonAppBar("lbl_booking_details".tr),
                SizedBox(height: 16.v),
                Obx(() => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: CustomImageView(
                    imagePath: controller.turfImage.value.isNotEmpty ? controller.turfImage.value : ImageConstant.imgRectangle40185,
                    height: 180.v,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    radius: BorderRadius.circular(16.h),
                  ),
                )),
                SizedBox(height: 20.v),
                Obx(() => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Text(
                    controller.turfTitle.value.isNotEmpty ? controller.turfTitle.value : "Turf Title",
                    style: theme.textTheme.titleLarge!.copyWith(color: appTheme.black900),
                  ),
                )),
                SizedBox(height: 5.v),
                Padding(
                  padding: EdgeInsets.only(left: 20.h, right: 20.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        color: appTheme.black900,
                        imagePath: ImageConstant.imgIcLocation,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          controller.turfAddress.value.isNotEmpty ? controller.turfAddress.value : "",  // You can add more location details here
                          style: theme.textTheme.bodyMedium!.copyWith(color: appTheme.black900),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.v),
                buildDetails(formattedDate, selectedTime, name, phoneNo),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: buildButtons(),
      ),
    );
  }

  /// Section Widget
  Widget buildDetails(String formattedDate, String selectedTime, String name, String phoneNo) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
        color: appTheme.textfieldFillColor,
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: EdgeInsets.only(right: 3.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("lbl_ground".tr, style: CustomTextStyles.bodyLargeGray60001),
              Obx(() => Text(
                controller.turfTitle.value.isNotEmpty ? controller.turfTitle.value : "Ground 01",
                style: theme.textTheme.titleMedium!.copyWith(color: appTheme.black900, fontSize: 16.fSize),
              )),
            ],
          ),
        ),
        // SizedBox(height: 20.v),
        // _buildDate(date: "lbl_booking_code".tr, friSep: "lbl_gr0175".tr),
        
        SizedBox(height: 18.v),
        _buildDate(date: "lbl_date".tr, friSep: formattedDate),
        SizedBox(height: 18.v),
        _buildDate(date: "lbl_time".tr, friSep: selectedTime),
        SizedBox(height: 18.v),
        _buildDate(date: 'Name.', friSep: name),
        SizedBox(height: 18.v),
        _buildDate(date: 'Phone No.', friSep: phoneNo),
      ]),
    );
  }

  /// Section Widget
  Widget buildButtons() {
    return Container(
      width: double.infinity,
      decoration: AppDecoration.white.copyWith(color: appTheme.bgColor),
      child: Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 16.v, bottom: 32.v),
        child: CustomElevatedButton(
          text: "msg_procced_to_payment".tr,
          onPressed: () {
            onTapProccedToPayment();
          },
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildDate({
    required String date,
    required String friSep,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Text(date, style: CustomTextStyles.bodyLargeGray60001.copyWith(color: appTheme.gray60001)),
      ),
      Text(friSep, style: CustomTextStyles.titleMedium16.copyWith(color: appTheme.black900)),
    ]);
  }

  /// Navigates to the selectDateTimeScreen when the action is triggered.
  onTapBookingDetails() {
    Get.toNamed(
      AppRoutes.selectDateTimeScreen,
    );
  }

  /// Navigates to the paymentScreen when the action is triggered.
  onTapProccedToPayment() {
    Get.toNamed(
      AppRoutes.paymentScreen,
    );
  }
}