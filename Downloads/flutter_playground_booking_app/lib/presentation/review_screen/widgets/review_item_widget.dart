import '../controller/review_controller.dart';
import '../models/review_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

// ignore: must_be_immutable
class ReviewItemWidget extends StatelessWidget {
  ReviewItemWidget(
    this.reviewItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ReviewItemModel reviewItemModelObj;

  var controller = Get.find<ReviewController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  CustomImageView(
                    // imagePath: reviewItemModelObj.image,
                    imagePath: 'assets/images/img_avtar_1.svg',
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    radius: BorderRadius.circular(
                      20.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      top: 13.v,
                      bottom: 6.v,
                    ),
                    child: Row(
                      children: [
                        Text(
                          reviewItemModelObj.firstName ?? 'First Name',
                          style: CustomTextStyles.titleMedium16!.copyWith(
                              color:appTheme.black900
                          ),
                        ),
                        SizedBox(width: 2.0),
                        Text(
                          reviewItemModelObj.lastName ?? 'Last Name',
                          style: CustomTextStyles.titleMedium16!.copyWith(
                              color:appTheme.black900
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),


             Row(
               children: [
                 CustomImageView(
                   imagePath: ImageConstant.imgIcStar,
                   height: 24.adaptSize,
                   width: 24.adaptSize,
                 ),
                 Padding(
                   padding: EdgeInsets.only(
                     left: 2.h,
                     top: 10.v,
                     bottom: 9.v,
                   ),
                   child: Text(
                     '${reviewItemModelObj.rating}.0',
                     style: theme.textTheme.bodyLarge!.copyWith(
                         color:appTheme.black900
                     ),
                   ),
                 ),
               ],
             )
            ],
          ),
          SizedBox(height: 10.v),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: 11.h),
            child:  Text(
              reviewItemModelObj.description ?? 'Review description',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: appTheme.black900,
                height: 1.50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
