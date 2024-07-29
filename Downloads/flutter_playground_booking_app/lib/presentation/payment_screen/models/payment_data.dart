import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/payment_screen/models/payment_model.dart';

class PaymentData{
  static List<PaymentModel> getPaymentData(){
    return [
      PaymentModel(ImageConstant.imgGooglePay, "lbl_google_pay".tr,1),
      PaymentModel(ImageConstant.imgPaypal, "lbl_paypal".tr,2),
      PaymentModel(ImageConstant.imgCash, "lbl_cash".tr,3),
    ];
  }
}