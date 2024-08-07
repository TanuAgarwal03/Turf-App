import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A controller class for the BookingDetailsOneScreen.
///
/// This class manages the state of the BookingDetailsOneScreen, including the
/// current bookingDetailsOneModelObj
// class BookingDetailsOneController extends GetxController {TextEditingController iclocationController = TextEditingController();

// Rx<BookingDetailsOneModel> bookingDetailsOneModelObj = BookingDetailsOneModel().obs;

// @override void onClose() { super.onClose(); iclocationController.dispose(); }
//  }
class BookingDetailsOneController extends GetxController {
  RxString turfTitle = ''.obs;
  RxString turfImage = ''.obs;
  RxString turfAddress = ''.obs;
  RxInt turfId = 0.obs;

  TextEditingController iclocationController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    iclocationController.dispose();
  }
}
