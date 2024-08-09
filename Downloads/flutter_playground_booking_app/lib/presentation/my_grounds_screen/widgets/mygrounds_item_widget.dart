import '../controller/my_grounds_controller.dart';
import '../models/mygrounds_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

class MygroundsItemWidget extends StatelessWidget {
  final MygroundsItemModel mygroundsItemModelObj;

  MygroundsItemWidget(this.mygroundsItemModelObj, {Key? key}) : super(key: key);

  final MyGroundsController controller = Get.find<MyGroundsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.h),
      decoration: AppDecoration.fillGray.copyWith(
        color: appTheme.textfieldFillColor,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: mygroundsItemModelObj.image!,
            height: 90.adaptSize,
            width: 90.adaptSize,
            radius: BorderRadius.circular(16.h),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h, top: 22.v, bottom: 20.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mygroundsItemModelObj.title!,
                  style: CustomTextStyles.titleMediumBlack900,
                ),
                SizedBox(height: 6.v),
                Text(
                  mygroundsItemModelObj.description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: CustomTextStyles.bodyLargeGray60001.copyWith(
                    color: appTheme.gray60001,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
