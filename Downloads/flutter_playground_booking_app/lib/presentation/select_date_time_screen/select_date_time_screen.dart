import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'controller/select_date_time_controller.dart';
import 'models/select_date_time_model.dart';


class SelectDateTimeScreen extends StatefulWidget {
  const SelectDateTimeScreen({super.key});

  @override
  State<SelectDateTimeScreen> createState() => _SelectDateTimeScreenState();
}

class _SelectDateTimeScreenState extends State<SelectDateTimeScreen> {
 SelectDateTimeController selectDateTimeController = Get.put(SelectDateTimeController());
 List<DateTime?> _dates = [];
 List<String> day = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
      backgroundColor: appTheme.bgColor,
      body: SafeArea(
       child: GetBuilder<SelectDateTimeController>(
         init: SelectDateTimeController(),
         builder:(controller) =>  Stack(
           children: [
                 SizedBox(
                 width: double.maxFinite,
                 child: Column(children:[
                  getCommonAppBar("msg_select_date_time".tr),
                  SizedBox(height: 16.v),
                   CalendarDatePicker2(
                     config: CalendarDatePicker2Config(
                         weekdayLabelTextStyle:
                      CustomTextStyles.titleMediumBold16,
                         weekdayLabels: day,

                         controlsTextStyle:
                         theme.textTheme.titleLarge!.copyWith(
                             color: appTheme.black900),
                         customModePickerIcon: Padding(
                           padding:  EdgeInsets.only(left: 16.h),
                           child: CustomImageView(
                             color: appTheme.black900,
                               imagePath: ImageConstant.imgarrowDown,
                               height: 24.adaptSize,
                               width: 24.adaptSize),
                         ),
                         lastMonthIcon: CustomImageView(
                           color: appTheme.black900,
                             imagePath: ImageConstant.imgIcDown,
                             height: 24.adaptSize,
                             width: 24.adaptSize),
                         nextMonthIcon: CustomImageView(
                             color: appTheme.black900,
                             imagePath: ImageConstant.imgIcNext,
                             height: 24.adaptSize,
                             width: 24.adaptSize),
                         dayTextStyle:  CustomTextStyles.titleMediumGray60001,
                         selectedDayHighlightColor:
                         appTheme.buttonColor,
                         selectedDayTextStyle:
                         CustomTextStyles
                             .titleMediumPrimaryContainer_1),
                     value: _dates,
                     onValueChanged: (dates) => _dates = dates,
                   ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text("lbl_select_time".tr,
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: appTheme.black900,
                              )))),
                  SizedBox(height: 19.v),
                   GridView.builder(
                     padding: EdgeInsets.symmetric(horizontal: 20.h),
                     primary: false,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 56.v,
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.h,
                          mainAxisSpacing: 16.v,),
                      itemCount: controller.timeData.length,
                      itemBuilder: (context, index) {
                        SelectDateTimeModel data = controller.timeData[index];
                       return GestureDetector(
                         onTap: (){
                            controller.currentTime = index;
                            controller.update();
                         },
                         child: Container(
                             padding: EdgeInsets.symmetric(horizontal: 10.h),
                             decoration: BoxDecoration(
                               color: controller.currentTime == index?appTheme.secondarybgcolor:appTheme.textfieldFillColor,
                                 borderRadius: BorderRadius.circular(20.h),
                                 border: Border.all(
                                     color: controller.currentTime == index?appTheme.buttonColor:Colors.transparent,
                                     width: 1.h)),
                             child: Center(
                               child: Text(data.time!,
                                   style: theme.textTheme.bodyLarge!.copyWith(
                                      color: appTheme.black900,
                                   )),
                             ),),
                       );
                      }),
                  SizedBox(height: 18.v),

                 ])),
             Align(
               alignment: Alignment.bottomCenter,
               child: Container(
                 width: double.infinity,
                 color: appTheme.bgColor,
                 child: Padding(
                   padding:  EdgeInsets.only(left: 16.h,right: 16.h,top: 16.v,bottom: 32.v),
                   child: buildButtons(),
                 ),
               ),
             )
               ],
         ),
       ),
      ));
 }

 /// Section Widget
 Widget buildContinue() {
  return CustomElevatedButton(
      text: "lbl_continue".tr,
      onPressed: () {
       onTapContinue();
      });
 }

 /// Section Widget
 Widget buildButtons() {
  return buildContinue();
 }

 /// Navigates to the bookingDetailsOneScreen when the action is triggered.
 onTapContinue() {
  Get.toNamed(
   AppRoutes.bookingDetailsOneScreen,
  );
 }
}




