import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:ecommerce_shoes_app/constants/images.dart';
import 'package:ecommerce_shoes_app/constants/messaging.dart';
import 'package:ecommerce_shoes_app/constants/style.dart';
import 'package:ecommerce_shoes_app/controller/sign_in_screen_controller.dart';
import 'package:ecommerce_shoes_app/controller/sign_up_screen_controller.dart';
import 'package:ecommerce_shoes_app/controller/sign_up_screen_controller.dart';
import 'package:ecommerce_shoes_app/utils/field_validation.dart';
import 'package:ecommerce_shoes_app/utils/input_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NameTextField extends StatelessWidget {
  NameTextField({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.none,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 25.0,
            blurStyle: BlurStyle.normal,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: signUpScreenController.signUpNamedController,
        decoration: formInputDecoration(
          hintText: 'Name',
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => FieldValidator().validateFullName(value!),
      ),
    );
  }
}

class SignUpEmailIdTextField extends StatelessWidget {
  SignUpEmailIdTextField({super.key});
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 25.0,
            blurStyle: BlurStyle.normal,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: TextFormField(
        controller: signUpScreenController.signUpEmailController,
        keyboardType: TextInputType.emailAddress,
        decoration:
            formInputDecoration(hintText: AppMessages.emailId, radius: 30),
        validator: (value) => FieldValidator().validateEmail(value!),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}

class SignUpPasswordTextField extends StatelessWidget {
  SignUpPasswordTextField({super.key});

  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 25.0,
            blurStyle: BlurStyle.normal,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: TextFormField(
        controller: signUpScreenController.signUpPasswordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: signUpScreenController.isPasswordVisible.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(8),
        ],
        decoration: formInputDecoration(
          hintText: AppMessages.password,
          radius: 30,
          sufficIcon: IconButton(
            onPressed: () {
              signUpScreenController.isLoading(true);
              signUpScreenController.isPasswordVisible.value =
                  !signUpScreenController.isPasswordVisible.value;
              signUpScreenController.isLoading(false);
            },
            icon: Icon(
              signUpScreenController.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
        validator: (value) => FieldValidator().validatePassword(value!),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  SignUpButton({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: AppColors.darkPinkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () async {
          if (signUpScreenController.formKey.currentState!.validate()) {
            await signUpScreenController.signUpUserFunction();
          }
        },
        child: Center(
          child: Text(
            AppMessages.signUp,
            style: TextStyleConfig.textStyle(
              textColor: AppColors.whiteColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpLoginWithFacebookModule extends StatelessWidget {
  const SignUpLoginWithFacebookModule({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: AppColors.darkBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () async {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.facebook),
                ),
              ),
            ),
            // SizedBox(width: 2.w),
            Text(
              AppMessages.loginWithFacebook,
              style: TextStyleConfig.textStyle(
                textColor: AppColors.whiteColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpLoginWithGoogleModule extends StatelessWidget {
  const SignUpLoginWithGoogleModule({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: AppColors.darkRedColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () async {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.google),
                ),
              ),
            ),
            // SizedBox(width: 2.w),
            Text(
              AppMessages.loginWithGoogle,
              style: TextStyleConfig.textStyle(
                textColor: AppColors.whiteColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
