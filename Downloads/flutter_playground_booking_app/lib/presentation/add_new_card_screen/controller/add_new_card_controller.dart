import 'package:flutter/material.dart';

/// A controller class for the AddNewCardScreen.
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/add_new_card_screen/models/add_new_card_model.dart';

///
/// This class manages the state of the AddNewCardScreen, including the
/// current addNewCardModelObj
class AddNewCardController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController cvvController = TextEditingController();
  Rx<AddNewCardModel> addCarDetailsOneModelObj = AddNewCardModel().obs;
  Rx<AddNewCardModel> addNewCardModelObj = AddNewCardModel().obs;
  SelectionPopupModel? selectedDropDownValue;
  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    cardNumberController.dispose();
    dateController.dispose();
    cvvController.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    addCarDetailsOneModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    addCarDetailsOneModelObj.value.dropdownItemList.refresh();
  }
}
