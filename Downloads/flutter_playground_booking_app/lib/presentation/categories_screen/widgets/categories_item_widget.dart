// import 'package:flutter/material.dart';
// import 'package:flutter_playground_booking_app/core/app_export.dart';
// import '../models/categories_item_model.dart';

// class CategoriesItemWidget extends StatelessWidget {
//   final CategoriesItemModel categoriesItemModelObj;
//   final VoidCallback? onTap;

//   CategoriesItemWidget(
//     this.categoriesItemModelObj,{this.onTap}
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             height: 85.adaptSize,
//             width: 85.adaptSize,
//             padding: EdgeInsets.all(22.h),
//             decoration: AppDecoration.fillOrange.copyWith(
//               color: categoriesItemModelObj.bgColor ?? Colors.transparent,
//               borderRadius: BorderRadiusStyle.roundedBorder42,
//             ),
//             child: CustomImageView(
//               imagePath: categoriesItemModelObj.icon,
//               height: 40.adaptSize,
//               width: 40.adaptSize,
//               alignment: Alignment.center,
//             ),
//           ),
//         ),
//         SizedBox(height:8.v),
//         Text(
//           categoriesItemModelObj.title ?? 'No Title',
//           textAlign: TextAlign.center,
//           style: theme.textTheme.bodyLarge!.copyWith(
//             color: appTheme.black900,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import '../models/categories_item_model.dart';

class CategoriesItemWidget extends StatelessWidget {
  final CategoriesItemModel categoriesItemModelObj;
  final VoidCallback? onTap;
  final bool isSelected; // Parameter to indicate selection state

  CategoriesItemWidget(
    this.categoriesItemModelObj, {
    this.onTap,
    this.isSelected = false, // Default to false if not provided
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 85.adaptSize,
            width: 85.adaptSize,
            padding: EdgeInsets.all(22.h),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blueAccent.withOpacity(0.2) : categoriesItemModelObj.bgColor ?? Colors.transparent,
              borderRadius: BorderRadiusStyle.roundedBorder42,
              border: Border.all(
                color: isSelected ? Colors.blueAccent : Colors.transparent,
                width: isSelected ? 2 : 0,
              ),
            ),
            child: CustomImageView(
              imagePath: categoriesItemModelObj.icon,
              height: 40.adaptSize,
              width: 40.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ),
        SizedBox(height: 8.v),
        Text(
          categoriesItemModelObj.title ?? 'No Title',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: isSelected ? Colors.blueAccent : appTheme.black900,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
