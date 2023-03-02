import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:ecommerce_shoes_app/constants/messaging.dart';
import 'package:ecommerce_shoes_app/controller/on_bording_screen_controller.dart';
import 'package:ecommerce_shoes_app/screen/authantication_screen/sign_In_screen/sign_in_screen.dart';
import 'package:ecommerce_shoes_app/screen/splash_screen/splash_screen.dart';
import 'package:ecommerce_shoes_app/utils/extensions.dart';
import 'package:ecommerce_shoes_app/utils/user_prefs_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class PageViewModule extends StatelessWidget {
  PageViewModule({super.key});
  final onBoardingScreenController = Get.find<OnBoardingScreenController>();
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: onBoardingScreenController.pageController,
      onPageChanged: onBoardingScreenController.selectedPageIndex,
      itemCount: onBoardingScreenController.onBoardingPages.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              onBoardingScreenController.onBoardingPages[index].imageAsset,
              height: Get.height * 0.20,
            ),
            SizedBox(height: 3.h),
            Text(
              onBoardingScreenController.onBoardingPages[index].title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              onBoardingScreenController.onBoardingPages[index].description,
              //textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17, color: Colors.white),
            ),
          ],
        ).commonOnlyPadding(top: 5.h, left: 5.w, right: 5.w);
      },
    );
  }
}

class ListGenerateModule extends StatelessWidget {
  ListGenerateModule({super.key});
  final onBoardingScreenController = Get.find<OnBoardingScreenController>();
  UserPrefsData userPrefsData = UserPrefsData();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool(userPrefsData.onboardingKey, true);
            Get.off(() => SignInScreen());
            //Get.off(page);
          },
          child: Obx(
            () => Text(
              onBoardingScreenController.isLastPage
                  ? AppMessages.doneIext
                  : AppMessages.skipText,
              style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
            ),
          ),
        ),
        Row(
          children: List.generate(
            onBoardingScreenController.onBoardingPages.length,
            (index) => Obx(
              () => Container(
                margin: const EdgeInsets.all(4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    color: onBoardingScreenController.selectedPageIndex.value ==
                            index
                        ? Colors.white
                        : Colors.grey,
                    shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ],
    ).commonOnlyPadding(left: 3.w, bottom: 1.h, right: 3.w);
  }
}
