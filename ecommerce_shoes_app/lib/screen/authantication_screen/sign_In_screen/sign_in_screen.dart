import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:ecommerce_shoes_app/constants/images.dart';
import 'package:ecommerce_shoes_app/constants/messaging.dart';
import 'package:ecommerce_shoes_app/controller/sign_in_screen_controller.dart';
import 'package:ecommerce_shoes_app/screen/authantication_screen/sign_In_screen/sign_in_screen_widgets.dart';
import 'package:ecommerce_shoes_app/screen/authantication_screen/sign_up_screen/sign_up_screen.dart';
import 'package:ecommerce_shoes_app/utils/extensions.dart';
import 'package:ecommerce_shoes_app/constants/style.dart';
import 'package:ecommerce_shoes_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final signInScreenController = Get.put(SignInScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => signInScreenController.isLoading.value
            ? const CustomCircularProgressIndicator()
            : SafeArea(
                child: Stack(
                  // alignment: Alignment.bottomCenter,
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
                            key: signInScreenController.formKey,
                            child: Column(
                              children: [
                                EmailIdTextField(),
                                SizedBox(height: 2.h),
                                PasswordTextField(),
                                SizedBox(height: 2.h),
                                LoginButton(),
                                SizedBox(height: 2.h),
                                const OrTextModule(),
                                SizedBox(height: 2.h),
                                const LoginWithFacebookModule(),
                                SizedBox(height: 2.h),
                                const LoginWithGoogleModule()
                              ],
                            ),
                          ).commonSymmetricPadding(vertical: 5.h),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppMessages.donotHaveAnAccount,
                              style: TextStyleConfig.textStyle(
                                  textColor: AppColors.whiteColor,
                                  fontSize: 12.sp),
                            ),
                            SizedBox(width: 3.w),
                            GestureDetector(
                              onTap: () {
                                Get.to(() =>  SignUpScreen());
                              },
                              child: Text(
                                AppMessages.signUp,
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
