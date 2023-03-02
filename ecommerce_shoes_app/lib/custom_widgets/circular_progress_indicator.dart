import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.darkPinkColor,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
