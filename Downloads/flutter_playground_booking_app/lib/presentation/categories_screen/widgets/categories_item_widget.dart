import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import '../models/categories_item_model.dart';

class CategoriesItemWidget extends StatefulWidget {
  final CategoriesItemModel categoriesItemModelObj;
  final VoidCallback? onTap;
  final bool isSelected;

  CategoriesItemWidget(
    this.categoriesItemModelObj, {
    this.onTap,
    this.isSelected = false, 
  });

  @override
  State<CategoriesItemWidget> createState() => _CategoriesItemWidgetState();
}

class _CategoriesItemWidgetState extends State<CategoriesItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            height: 85.adaptSize,
            width: 85.adaptSize,
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? Colors.blueAccent.withOpacity(0.2)
                  : widget.categoriesItemModelObj.bgColor ?? Colors.transparent,
              borderRadius: BorderRadiusStyle.roundedBorder42,
              border: Border.all(
                color: widget.isSelected ? Colors.blueAccent : Colors.transparent,
                width: widget.isSelected ? 1: 0,
              ),
            ),
            child: CustomImageView(
              imagePath: widget.categoriesItemModelObj.icon,
              height: 40.adaptSize,
              width: 40.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ),
        SizedBox(height: 8.v),
        Text(
          widget.categoriesItemModelObj.title ?? 'No Title',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: widget.isSelected ? Colors.blueAccent : appTheme.black900,
            fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
