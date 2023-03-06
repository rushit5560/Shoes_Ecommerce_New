import 'package:ecommerce_shoes_app/controller/home_screen_controller.dart';
import 'package:ecommerce_shoes_app/custom_widgets/circular_progress_indicator.dart';
import 'package:ecommerce_shoes_app/custom_widgets/home_drawer.dart';
import 'package:ecommerce_shoes_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../custom_widgets/custom_appbar.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPinkColor,
      appBar: commonAppBarModule(),
      drawer: CustomDrawer(),
      body: Obx(
        () => homeScreenController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    flex: -1,
                    child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: const SearchTextFieldModule())
                        .commonOnlyPadding(left: 3.w, right: 3.w),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: double.infinity.h,
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        children: const [
                          ProductImageSliderModule(),
                         //Text('data'),
                          NewCollectionModule(),
                        ],
                      ),
                    ).commonOnlyPadding(top: 3.h),
                  ),
                ],
              ),
      ),
    );
  }
}
