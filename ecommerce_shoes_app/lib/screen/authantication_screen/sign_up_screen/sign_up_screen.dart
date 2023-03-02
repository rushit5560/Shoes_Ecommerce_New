import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:ecommerce_shoes_app/constants/images.dart';
import 'package:ecommerce_shoes_app/constants/messaging.dart';
import 'package:ecommerce_shoes_app/constants/style.dart';
import 'package:ecommerce_shoes_app/controller/sign_up_screen_controller.dart';
import 'package:ecommerce_shoes_app/custom_widgets/or_text.dart';
import 'package:ecommerce_shoes_app/screen/authantication_screen/sign_In_screen/sign_in_screen.dart';
import 'package:ecommerce_shoes_app/screen/authantication_screen/sign_up_screen/sign_up_screen_widgets.dart';
import 'package:ecommerce_shoes_app/utils/extensions.dart';
import 'package:ecommerce_shoes_app/custom_widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => signUpScreenController.isLoading.value
            ? const CustomCircularProgressIndicator()
            : SafeArea(
                child: Stack(
                  children: [
                    Container(
                      height: Get.height,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.splashImage),
                          fit: BoxFit.cover,
                          // opacity: 0.8,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppMessages.login,
                              style: TextStyleConfig.textStyle(
                                  textColor: AppColors.whiteColor,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 30,
                          ),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Form(
                            key: signUpScreenController.formKey,
                            child: Column(
                              children: [
                                NameTextField(),
                                SizedBox(height: 2.h),
                                SignUpEmailIdTextField(),
                                SizedBox(height: 2.h),
                                SignUpPasswordTextField(),
                                SizedBox(height: 2.h),
                                SignUpButton(),
                                SizedBox(height: 2.h),
                                const OrTextModule(),
                                SizedBox(height: 2.h),
                                const SignUpLoginWithFacebookModule(),
                                SizedBox(height: 2.h),
                                const SignUpLoginWithGoogleModule()
                              ],
                            ),
                          ).commonSymmetricPadding(vertical: 5.h),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppMessages.alreadyHaveAnAccount,
                              style: TextStyleConfig.textStyle(
                                  textColor: AppColors.whiteColor,
                                  fontSize: 12.sp),
                            ),
                            SizedBox(width: 3.w),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => SignInScreen(),
                                );
                              },
                              child: Text(
                                AppMessages.login,
                                style: TextStyleConfig.textStyle(
                                  textColor: AppColors.darkRedColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ).commonSymmetricPadding(horizontal: 20),
                  ],
                ),
              ),
      ),
    );
  }
}
