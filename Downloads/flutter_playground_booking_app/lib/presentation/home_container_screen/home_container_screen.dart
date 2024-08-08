// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/events_page/events_page.dart';
import 'package:flutter_playground_booking_app/presentation/home_page/home_page.dart';
import 'package:flutter_playground_booking_app/presentation/my_booking_upcoming_tab_container_screen/my_booking_upcoming_tab_container_screen.dart';
import 'package:flutter_playground_booking_app/presentation/profile_screen/profile_screen.dart';
import 'package:flutter_playground_booking_app/widgets/custom_bottom_bar.dart';
import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../histry_upcoming_completed_tab_container/histry_upcoming_completed_tab_container.dart';
import 'controller/home_container_controller.dart';


class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({super.key});

  @override
  State<HomeContainerScreen> createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  HomeContainerController controller = Get.put(HomeContainerController());
  List<Widget> screen = [

    HomePage(),
    MyBookingUpcomingTabContainerScreen(),
    EventsPage(),
    HistryUpcomingCompletedTab(),
    ProfileScreen()


  ];
  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder:(controller) =>  WillPopScope(
        onWillPop: () async {
          if (controller.selectedIndex == 0) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                    insetPadding: EdgeInsets.all(16.v),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.h)),
                    contentPadding: EdgeInsets.zero,
                    content: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 32.v),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Are you sure you want to exit app?",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: appTheme.black900
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 0.h,
                              top: 28.v,
                              right: 0.h,
                              bottom: 0.v,
                            ),
                            child: Row(
                              children: [
                                CustomOutlinedButton(
                                  width: 170.h,
                                    text: "No",
                                    margin: EdgeInsets.only(
                                        right: 8.h),
                                    onPressed: () {
                                      Get.back();
                                    }),
                                SizedBox(
                                  width: 8.h,
                                ),
                                CustomElevatedButton(
                                  width: 170.h,
                                    height: 56.v,
                                    text: "Exit",
                                    onPressed: () {
                                      if (controller.selectedIndex == 0) {
                                        closeApp();
                                      } else {
                                        controller.getIndex(0);
                                        Get.back();
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            );
          } else {
            controller.getIndex(0);
            // Get.back();
          }
          return false;
        },
        child: Scaffold(
            backgroundColor: appTheme.bgColor,
            body: SafeArea(child: screen[controller.selectedIndex]),
            bottomNavigationBar:
            CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })),
      ),
    );
  }


  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Booking:
        return AppRoutes.myBookingEmptyPage;
      case BottomBarEnum.Event:
        return AppRoutes.eventsPage;
      case BottomBarEnum.History:
        return AppRoutes.historyEmptyPage;
      case BottomBarEnum.Profile:
        return AppRoutes.guestUserProfilePage;
      default:
        return "/";
    }
  }
}





