import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/confirm_delete_popup_screen/confirm_delete_popup_screen.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'controller/reason_to_cancel_popup_controller.dart';
import 'models/cancel_order_reason_data_model.dart';



class ReasonToCancelPopupScreen extends StatefulWidget {
  const ReasonToCancelPopupScreen({super.key});

  @override
  State<ReasonToCancelPopupScreen> createState() => _ReasonToCancelPopupScreenState();
}

class _ReasonToCancelPopupScreenState extends State<ReasonToCancelPopupScreen> {
  ReasonToCancelPopupController controller = Get.put(ReasonToCancelPopupController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<ReasonToCancelPopupController>(
      init: ReasonToCancelPopupController(),
      builder:(controller) =>  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 35.v),
            Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text("msg_reason_to_cancel".tr,
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: appTheme.black900,
                    ))),
            SizedBox(height: 18.v),
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              primary: false,
              shrinkWrap: true,
              itemCount: controller.reasonDataList.length,
              itemBuilder: (context, index) {
                ResonModel data = controller.reasonDataList[index];
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 12.v),
                child: GestureDetector(
                  onTap: (){
                    controller.selectedValue = data.id!;
                    controller.update();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: controller.selectedValue == data.id?ImageConstant.imgRadioButtonSelected:ImageConstant.imgRadioButtonunSelected,
                        ),
                        SizedBox(width: 16.h),
                        Text(data.title!,style: theme.textTheme.bodyLarge!.copyWith(
                          color: appTheme.black900,
                        ),),
                      ],
                    ),
                  ),
                ),
              );
            },),
            // _buildReasonToCancel(),
            SizedBox(height: 16.v),
            buildButtons()
          ]),
    );
  }


  /// Section Widget
  Widget buildButtons() {
    return Container(
        width: double.infinity,
        color: PrefUtils().getThemeData() == "primary"
            ? appTheme.whiteA700
            : appTheme.darkgray,
        child:  Padding(
          padding:  EdgeInsets.only(top: 16.v,bottom: 32.v,left: 20.h,right: 20.h),
          child: CustomElevatedButton(
              text: "lbl_cancel_booking".tr,
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
                        content: ConfirmDeletePopupScreen());
                  },
                );
              }),
        ));
  }

  /// Navigates to the selectDateTimeScreen when the action is triggered.
  onTapCancelBooking() {
    Get.toNamed(
      AppRoutes.selectDateTimeScreen,
    );
  }
}





