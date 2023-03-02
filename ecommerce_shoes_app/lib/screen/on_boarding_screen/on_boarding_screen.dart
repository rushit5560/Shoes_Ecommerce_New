import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:ecommerce_shoes_app/constants/images.dart';
import 'package:ecommerce_shoes_app/controller/on_bording_screen_controller.dart';
import 'package:ecommerce_shoes_app/screen/on_boarding_screen/on_bording_screen_widgets.dart';
import 'package:ecommerce_shoes_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final onBoardingController = Get.put(OnBoardingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.splashImage),
                  fit: BoxFit.cover,
                  ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onBoardingController.isLastPage) {
                onBoardingController.setOnBoardingValue();
                onBoardingController.goToLoginScreen();
              }
              // onHorizontalDragStart:
              // (DragStartDetails start) {
              //   onBoardingController.goToLoginScreen();
              // };
            },
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                height: Get.height / 1.7,
                // height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.darkPinkColor),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageViewModule(),
                    ListGenerateModule(),
                  ],
                ),
              ).commonSymmetricPadding(horizontal: 8.w),
            ),
          ),
        ],
      ),
    );
  }
}
