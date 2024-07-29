import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/categories_screen/models/categories_model.dart';

import '../models/categories_item_model.dart';

/// A controller class for the CategoriesScreen.
///
/// This class manages the state of the CategoriesScreen, including the
/// current categoriesModelObj
class CategoriesController extends GetxController {
 // List<CategoriesItemModel> categoriesItemList()
   List<CategoriesItemModel> categoriesData = CategoriesModel.categoriesItemList();
}
