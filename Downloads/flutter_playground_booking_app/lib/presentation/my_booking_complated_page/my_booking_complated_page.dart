import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'controller/my_booking_complated_controller.dart';
import 'models/my_booking_complated_model.dart';

// ignore: must_be_immutable
class MyBookingComplatedPage extends StatelessWidget {
  MyBookingComplatedPage({Key? key})
      : super(
          key: key,
        );

  MyBookingComplatedController controller =
      Get.put(MyBookingComplatedController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.v),
      itemCount: controller.getMybookingComplated.length,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        MyBookingComplatedModel data = controller.getMybookingComplated[index];
        return animationfunction(index, Padding(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(4.h),
              decoration: AppDecoration.fillGray.copyWith(
                color: appTheme.textfieldFillColor,
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: data.image,
                    height: 90.adaptSize,
                    width: 90.adaptSize,
                    radius: BorderRadius.circular(
                      16.h,
                    ),
                    margin: EdgeInsets.only(top: 2.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      top: 23.v,
                      bottom: 17.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title!,
                          style: theme.textTheme.titleMedium!.copyWith(
                            color: appTheme.black900,
                          ),
                        ),
                        SizedBox(height: 9.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgIcLocationGray60001,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text(
                                data.location!,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgIcBooking,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              margin: EdgeInsets.only(left: 16.h),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 8.h,
                                top: 2.v,
                              ),
                              child: Text(
                                data.location!,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
