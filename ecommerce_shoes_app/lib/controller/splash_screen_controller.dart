import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_shoes_app/constants/userdetails.dart';
import 'package:ecommerce_shoes_app/screen/authantication_screen/sign_In_screen/sign_in_screen.dart';
import 'package:ecommerce_shoes_app/screen/index_screen/index_screen.dart';
import 'package:ecommerce_shoes_app/screen/on_boarding_screen/on_boarding_screen.dart';
import 'package:ecommerce_shoes_app/utils/user_prefs_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = false.obs;
  bool? onBoardingValue = false;

  UserPrefsData userPrefsData = UserPrefsData();
  getOnBoardingValue() async {
    log("222");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoardingValue = prefs.getBool(userPrefsData.onboardingKey) ?? false;
    UserDetails.isUserLoggedIn =
        prefs.getBool(userPrefsData.userLoggedInStatusKey) ?? false;
    UserDetails.userId = prefs.getString(userPrefsData.idKey) ?? "0";
    UserDetails.token = prefs.getString(userPrefsData.tokenKey) ?? "";
    UserDetails.userName = prefs.getString(userPrefsData.userNameKey) ?? "";
    UserDetails.userEmail = prefs.getString(userPrefsData.userEmailKey) ?? "";
    log('Value : $onBoardingValue');
    log('isUserLoggedIn : ${UserDetails.isUserLoggedIn}');
    log("3330");

    if (onBoardingValue == true) {
      log("if");
      if (UserDetails.isUserLoggedIn == false) {
        Get.off(() => SignInScreen());
      } else {
        Get.off(() => IndexScreen());
      }
    } else {
      log("else");
      Get.off(() => OnBoardingScreen());
    }
  }

  @override
  void onInit() {
    log("Splash screen 111");
    Timer(
      const Duration(seconds: 3),
      () => getOnBoardingValue(),
    );
    super.onInit();
  }
}
