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

class OrTextModule extends StatelessWidget {
  const OrTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1, child: Container(color: Colors.grey.shade300, height: 2)),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "OR",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 1, child: Container(color: Colors.grey.shade300, height: 2)),
      ],
    );
  }
}
