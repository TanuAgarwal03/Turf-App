import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'controller/select_date_time_controller.dart';
import 'models/select_date_time_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SelectDateTimeScreen extends StatefulWidget {
  const SelectDateTimeScreen({super.key});

  @override
  State<SelectDateTimeScreen> createState() => _SelectDateTimeScreenState();
}

class _SelectDateTimeScreenState extends State<SelectDateTimeScreen> {
  SelectDateTimeController selectDateTimeController = Get.put(SelectDateTimeController());
  List<DateTime?> _dates = [];
  List<String> day = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
  int? turfId;
  int? userId;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _retrieveUserId();
  }

  Future<void> _retrieveUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('user_id');
    });
  }

  Future<void> _createBooking() async {
    if (userId == null || turfId == null) {
      Get.snackbar('Error', 'User ID or Turf ID is missing.');
      return;
    }

    final bookingDate = selectDateTimeController.selectedDate.value.toString().split(' ')[0];
    final selectedTime = selectDateTimeController.timeData[selectDateTimeController.currentTime.value].time;

    final url = Uri.parse(
      'https://lytechxagency.website/turf/wp-json/wp/v1/turf_booking',
    );

    final response = await http.post(
      url,
      body: {
        'booking_date': bookingDate,
        'post_id': turfId.toString(),
        'user_id': userId.toString(),
        'timefrom': selectedTime,
        'timeto': selectedTime,  // Assuming end time is the same as start time for simplicity
        'name': selectDateTimeController.nameController.text,
        'phone_number': selectDateTimeController.phoneNumberController.text,
      },
    );

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Booking created successfully.');
      // Navigate to the next screen if needed
      // Get.toNamed(AppRoutes.bookingDetailsOneScreen);
    } else {
      Get.snackbar('Error', 'Failed to create booking.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    turfId = arguments['turfId'] as int?;
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: GetBuilder<SelectDateTimeController>(
          init: SelectDateTimeController(),
          builder: (controller) => Column(
            children: [
              getCommonAppBar("msg_select_date_time".tr),
              SizedBox(height: 16.v),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CalendarDatePicker2(
                            config: CalendarDatePicker2Config(
                              weekdayLabelTextStyle: CustomTextStyles.titleMediumBold16,
                              weekdayLabels: day,
                              controlsTextStyle: theme.textTheme.titleLarge!.copyWith(color: appTheme.black900),
                              customModePickerIcon: Padding(
                                padding: EdgeInsets.only(left: 16.h),
                                child: CustomImageView(
                                  color: appTheme.black900,
                                  imagePath: ImageConstant.imgarrowDown,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                ),
                              ),
                              lastMonthIcon: CustomImageView(
                                color: appTheme.black900,
                                imagePath: ImageConstant.imgIcDown,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                              nextMonthIcon: CustomImageView(
                                color: appTheme.black900,
                                imagePath: ImageConstant.imgIcNext,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                              dayTextStyle: CustomTextStyles.titleMediumGray60001,
                              selectedDayHighlightColor: appTheme.buttonColor,
                              selectedDayTextStyle: CustomTextStyles.titleMediumPrimaryContainer_1,
                            ),
                            value: _dates,
                            onValueChanged: (dates) {
                              _dates = dates;
                              if (dates.isNotEmpty) {
                                controller.selectedDate.value = dates.first;
                              }
                            },
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: Text(
                                "lbl_select_time".tr,
                                style: theme.textTheme.titleLarge!.copyWith(color: appTheme.black900),
                              ),
                            ),
                          ),
                          SizedBox(height: 19.v),
                          GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            primary: false,
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 56.v,
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.h,
                              mainAxisSpacing: 16.v,
                            ),
                            itemCount: controller.timeData.length,
                            itemBuilder: (context, index) {
                              SelectDateTimeModel data = controller.timeData[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.currentTime.value = index;
                                  controller.update();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                                  decoration: BoxDecoration(
                                    color: controller.currentTime.value == index
                                        ? appTheme.secondarybgcolor
                                        : appTheme.textfieldFillColor,
                                    borderRadius: BorderRadius.circular(20.h),
                                    border: Border.all(
                                      color: controller.currentTime.value == index
                                          ? appTheme.buttonColor
                                          : Colors.transparent,
                                      width: 1.h,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      data.time!,
                                      style: theme.textTheme.bodyLarge!.copyWith(color: appTheme.black900),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 18.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Enter the name.',
                                    labelText: 'Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cannot be null';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20.h),
                                TextFormField(
                                  controller: controller.phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Contact No.',
                                    hintText: 'Enter your mobile number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Contact number cannot be null';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18.v),
                          Container(
                            padding: EdgeInsets.all(16.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.h),
                              border: Border.all(color: appTheme.buttonColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User ID: ${userId ?? 'Loading...'}',
                                  style: theme.textTheme.bodyLarge!.copyWith(color: appTheme.black900),
                                ),
                                SizedBox(height: 8.v),
                                Text(
                                  'Turf ID: ${turfId ?? 'Loading...'}',
                                  style: theme.textTheme.bodyLarge!.copyWith(color: appTheme.black900),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  color: appTheme.bgColor,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 16.v, bottom: 32.v),
                    child: buildContinue(),
                  ),
                ),
              ),
              Obx(() => Text(controller.bookingMessage.value)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContinue() {
    return CustomElevatedButton(
      text: "lbl_continue".tr,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          _createBooking();
          Get.toNamed(AppRoutes.paymentScreen);
        }
      },
    );
  }

  Widget buildButtons() {
    return buildContinue();
  }
}
