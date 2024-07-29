import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "Login".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Splash screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding Three".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingThreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Login error".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginErrorScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Login filled".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginFilledScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Sign up".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forgot password?".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Verification".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.verificationScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Reset password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.resetPasswordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Password changed! popup".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.passwordChangedPopupScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Home - Container".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Notification empty".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.notificationEmptyScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Notification ".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.notificationScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Search".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.searchScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Search fill".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.searchFillScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Filter".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.filterScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Search result".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.searchResultScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Categories".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.categoriesScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Foot ball".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.footBallScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Popular ground".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.popularGroundScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Nearby You".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.nearbyYouScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Detail screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.detailScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Review".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.reviewScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Write a review".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.writeAReviewScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Select date & time".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.selectDateTimeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Booking details One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.bookingDetailsOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Payment ".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.paymentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Add new card".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addNewCardScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Order placed".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.orderPlacedScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "My booking / Upcoming - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.myBookingUpcomingTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Booking details".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.bookingDetailsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Reason to cancel? popup".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.reasonToCancelPopupScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Confirm delete popup".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.confirmDeletePopupScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Events empty".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.eventsEmptyScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Events detail".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.eventsDetailScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Events detail Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.eventsDetailTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "History detail".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.historyDetailScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "History complate detail".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.historyComplateDetailScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "My profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Edit profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.settingsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Privacy policy".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.privacyPolicyScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Help".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.helpScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "About us".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.aboutUsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Rate us experirnce".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.rateUsExperirnceScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "My grounds".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myGroundsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Add ground".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addGroundScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Ground category".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.groundCategoryScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Add photos".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addPhotosScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Success popup".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.successPopupScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
