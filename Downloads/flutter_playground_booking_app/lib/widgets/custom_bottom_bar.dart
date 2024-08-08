import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'app_bar/custum_bottom_bar_controller.dart';
import 'dart:io' show Platform;

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
    key: key,
  );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHomeSelected,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavBooking,
      activeIcon: ImageConstant.imgNavBookingSelected,
      title: "lbl_booking".tr,
      type: BottomBarEnum.Booking,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavEvent,
      activeIcon: ImageConstant.imgNavEventSelected,
      title: "lbl_event".tr,
      type: BottomBarEnum.Event,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavHistory,
      activeIcon: ImageConstant.imgNavHistorySelected,
      title: "lbl_history".tr,
      type: BottomBarEnum.History,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfileSelected,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isAndroid ? 90.v : 120.v,
      decoration: PrefUtils().getThemeData() == "primary"?BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.04),
            spreadRadius: 2.h,
            blurRadius: 16.h,
            offset: Offset(
              0,
              -6,
            ),
          ),
        ],
      ):BoxDecoration(
      color: appTheme.bgColor,
    ),
      child:
        GetBuilder<CustomBottomBarController>(
          init: CustomBottomBarController(),
          builder:(controller) =>  BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            elevation: 0,
            currentIndex: controller.selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              return BottomNavigationBarItem(
                icon: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: bottomMenuList[index].icon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.v,
                        ),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: appTheme.gray60001,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                activeIcon: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: bottomMenuList[index].activeIcon,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.v,
                        ),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          style: CustomTextStyles.bodyMediumPrimary.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              );
            }),
            onTap: (index) {
              controller.getIndex(index);
            },
          ),
        ),

    );
  }
}

enum BottomBarEnum {
  Home,
  Booking,
  Event,
  History,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
