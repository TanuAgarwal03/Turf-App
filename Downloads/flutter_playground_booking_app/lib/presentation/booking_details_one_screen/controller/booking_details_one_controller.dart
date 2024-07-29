import 'package:flutter_playground_booking_app/core/app_export.dart';import 'package:flutter_playground_booking_app/presentation/booking_details_one_screen/models/booking_details_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the BookingDetailsOneScreen.
///
/// This class manages the state of the BookingDetailsOneScreen, including the
/// current bookingDetailsOneModelObj
class BookingDetailsOneController extends GetxController {TextEditingController iclocationController = TextEditingController();

Rx<BookingDetailsOneModel> bookingDetailsOneModelObj = BookingDetailsOneModel().obs;

@override void onClose() { super.onClose(); iclocationController.dispose(); } 
 }
