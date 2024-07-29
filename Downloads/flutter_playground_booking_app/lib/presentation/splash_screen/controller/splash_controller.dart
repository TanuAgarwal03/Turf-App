import 'dart:async';
import 'package:get/get.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../routes/app_routes.dart';
import '../models/splash_model.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      print("themedata is ======== ${PrefUtils().getThemeData()}");
      _getIsFirst();
    });
  }

  _getIsFirst() async {
    bool isSignIn = await PrefUtils.getIsSignIn();
    bool isIntro = await PrefUtils.getIsIntro();
    Timer(const Duration(seconds: 3), () {
      print("is intro ====== $isIntro");
      print("isSignIn ====== $isSignIn");
      if (isIntro) {
        Get.toNamed(AppRoutes.onboardingOneScreen);
      } else if (isSignIn) {
        Get.toNamed(AppRoutes.loginScreen);
      } else {
        Get.toNamed(AppRoutes.homeContainerScreen);
      }
    });
  }
}
