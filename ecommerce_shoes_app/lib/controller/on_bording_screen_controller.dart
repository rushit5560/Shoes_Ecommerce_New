import 'dart:developer';

import 'package:ecommerce_shoes_app/constants/images.dart';
import 'package:ecommerce_shoes_app/models/on_bording_screen_model/on_bording_model.dart';
import 'package:ecommerce_shoes_app/screen/authantication_screen/sign_In_screen/sign_in_screen.dart';
import 'package:ecommerce_shoes_app/utils/user_prefs_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreenController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;
  UserPrefsData userPrefsData = UserPrefsData();

  @override
  void onInit() {
    //forwardAction();
    super.onInit();
  }

  goToLoginScreen() => Get.offAll(() => SignInScreen());

  setOnBoardingValue() async {
    log('Call Set Value Method');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(userPrefsData.onboardingKey, true);
    prefs.getBool(userPrefsData.onboardingKey);
    log('Set Value : ${prefs.getBool(userPrefsData.onboardingKey)}');
  }

  /*forwardAction() {
    log("value==$isLastPage");
    if(isLastPage){

      //setOnBoardingValue();
      Timer(Duration(seconds: 1), () => IndexScreen());
      //Get.off(() => IndexScreen());
    } else {
      // pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }*/

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
      imageAsset: AppImages.service1,
      title: '30 Days Money Back Guarantee',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingInfo(
      imageAsset: AppImages.service2,
      title: 'Free Delivery',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingInfo(
      imageAsset: AppImages.service3,
      title: 'Secure Payment',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
  ];
}
