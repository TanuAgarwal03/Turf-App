import 'package:image_picker/image_picker.dart';


/// This class is used in the [addphotos_item_widget] screen.

class AddphotosItemModel {
  XFile? image;
  bool? isSelected;
  AddphotosItemModel(this.image,this.isSelected);
}
