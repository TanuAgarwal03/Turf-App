import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/popular_ground_screen/models/popularground_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopulargroundItemWidget extends StatelessWidget {
  final PopulargroundItemModel populargroundItemModelObj;

  PopulargroundItemWidget(this.populargroundItemModelObj, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        final turfId = populargroundItemModelObj.id;
        
        if (turfId != null) {
          await prefs.setInt('selectedTurfId', turfId);
          print('Turf ID saved: $turfId');
        } else {
          print('Turf ID is null, defaulting to 18');
          await prefs.setInt('selectedTurfId', 18); 
        }

        Get.toNamed(AppRoutes.detailScreen, arguments: turfId);
        print('Turf ID saved');
      },
      child: Container(
        width: double.infinity,
        decoration: AppDecoration.fillGray.copyWith(
          color: appTheme.textfieldFillColor,
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: populargroundItemModelObj.image ?? 'assets/images/img_soccer_1.svg',
              child: CustomImageView(
                imagePath: populargroundItemModelObj.image,
                height: 181.v,
                width: double.infinity,
                radius: BorderRadius.circular(16.h),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        populargroundItemModelObj.title ?? 'No Title',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: appTheme.black900,
                        ),
                      ),
                      SizedBox(height: 4.5.v),
                      Row(
                        children: [
                          CustomImageView(
                            color: appTheme.black900,
                            imagePath: ImageConstant.imgIcLocation,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.h),
                            child: Text(
                              populargroundItemModelObj.location ?? 'Unknown Location',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: appTheme.black900,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.v),
          ],
        ),
      ),
    );
  }
}
