import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_icon_button.dart';
import 'controller/payment_controller.dart';
import 'models/payment_model.dart';




class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
 PaymentController paymentController = Get.put(PaymentController());

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
   backgroundColor: appTheme.bgColor,
      body: SafeArea(
        child: GetBuilder<PaymentController>(
          init: PaymentController(),
          builder:(controller) =>  Column(children: [
          getCommonAppBar("lbl_payment".tr),
           SizedBox(height: 16.v),

           ListView.separated(
               primary: false,
               shrinkWrap: true,
               itemBuilder: (context, index) {
             PaymentModel data = controller.paymentData[index];
             return Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 8),
                 child: GestureDetector(
                   onTap: (){
                     controller.selectedPaymentMethod = index;
                     controller.update();
                   },
                   child: Container(
                     color: appTheme.bgColor,
                     child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                       CustomIconButton(
                           height: 56.adaptSize,
                           width: 56.adaptSize,
                           padding: EdgeInsets.all(6.h),
                           decoration: IconButtonStyleHelper.fillGrayTL16.copyWith(
                             color: appTheme.textfieldFillColor,
                           ),
                           child: CustomImageView(imagePath:data.icon)),
                       Padding(
                           padding: EdgeInsets.only(left: 16.h, top: 19.v, bottom: 16.v),
                           child: Text(data.title!,
                               style: theme.textTheme.bodyLarge!
                                   .copyWith(color: appTheme.black900))),
                       Spacer(),
                       CustomImageView(
                           imagePath: controller.selectedPaymentMethod == index?ImageConstant.imgRadioButtonSelected:
                           ImageConstant.imgRadioButtonunSelected,
                           height: 24.adaptSize,
                           width: 24.adaptSize,
                           margin: EdgeInsets.symmetric(vertical: 16.v))
                     ]),
                   ),
                 ));
           }, separatorBuilder: (context, index) {
             return Opacity(
                 opacity: 0.16,
                 child: Divider(indent: 20.h, endIndent: 20.h));
           }, itemCount: controller.paymentData.length),

           SizedBox(height: 16.v),
           CustomElevatedButton(
               height: 24.v,
               width: 126.h,
               text: "lbl_add_new_card".tr,
               leftIcon: Container(
                   margin: EdgeInsets.only(right: 8.h),
                   child: CustomImageView(
                     color: appTheme.black900,
                       imagePath: ImageConstant.imgIcAdd,
                       height: 24.adaptSize,
                       width: 24.adaptSize)),
               buttonStyle: CustomButtonStyles.none,
               buttonTextStyle: theme.textTheme.bodyLarge!.copyWith(
                 color: appTheme.black900
               ),
               onPressed: () {
                onTapAddNewCard();
               }),
           SizedBox(height: 5.v)
          ]),
        ),
      ),
      bottomNavigationBar: buildButtons());
 }



 /// Section Widget
 Widget buildButtons() {
  return Container(
    width: double.infinity,
      decoration: AppDecoration.white.copyWith(
        color: appTheme.bgColor
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 20.h,right:20.h,top:16.v,bottom: 32.v),
        child: CustomElevatedButton(
            text: "lbl_continue".tr,
            onPressed: () {
             onTapContinue();
            }),
      ));
 }



 /// Navigates to the bookingDetailsOneScreen when the action is triggered.
 onTapPayment() {
  Get.toNamed(
   AppRoutes.bookingDetailsOneScreen,
  );
 }

 /// Navigates to the addNewCardScreen when the action is triggered.
 onTapAddNewCard() {
  Get.toNamed(
   AppRoutes.addNewCardScreen,
  );
 }

 /// Navigates to the orderPlacedScreen when the action is triggered.
 onTapContinue() {
  Get.toNamed(
   AppRoutes.orderPlacedScreen,
  );
 }
}




