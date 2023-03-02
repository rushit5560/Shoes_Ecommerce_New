import 'package:ecommerce_shoes_app/constants/images.dart';
import 'package:ecommerce_shoes_app/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Image.asset(
            AppImages.splashImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
