import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import '../models/categories_item_model.dart';

class CategoriesItemWidget extends StatelessWidget {
  CategoriesItemWidget(
    this.categoriesItemModelObj, {
    Key? key,
    this.onTapFootball,
  }) : super(key: key);

  final CategoriesItemModel categoriesItemModelObj;
  final VoidCallback? onTapFootball;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTapFootball?.call();
          },
          child: Container(
            height: 85.adaptSize,
            width: 85.adaptSize,
            padding: EdgeInsets.all(22.h),
            decoration: AppDecoration.fillOrange.copyWith(
              color: categoriesItemModelObj.bgColor ?? Colors.transparent,
              borderRadius: BorderRadiusStyle.roundedBorder42,
            ),
            child: CustomImageView(
              imagePath: categoriesItemModelObj.icon,
              height: 40.adaptSize,
              width: 40.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ),
        SizedBox(height:8.v),
        Text(
          categoriesItemModelObj.title ?? 'No Title',
          style: theme.textTheme.bodyLarge!.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
}
