import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';

class LogOutDialogue extends StatefulWidget {
  const LogOutDialogue({super.key});

  @override
  State<LogOutDialogue> createState() => _LogOutDialogueState();
}

class _LogOutDialogueState extends State<LogOutDialogue> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder:(controller) =>  Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 32.v),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.v),
            Text(
              "Are you sure you want to Log out?",
              style: theme.textTheme.titleMedium!.copyWith(
                color: appTheme.black900,
              ),
            ),
            SizedBox(height: 24.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomOutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  width: 170.h,
                  text: "lbl_cancel".tr,
                  margin: EdgeInsets.only(right: 8.h),
                ),
                CustomElevatedButton(
                  onPressed: (){
                    PrefUtils.setIsSignIn(true);
                    controller.getIndex(0);
                    Get.offAllNamed(AppRoutes.loginScreen);
                  },
                  width: 170.h,
                  text: "Logout",
                  margin: EdgeInsets.only(left: 8.h),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
