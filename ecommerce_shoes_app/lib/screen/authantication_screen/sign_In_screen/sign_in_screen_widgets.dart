import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:ecommerce_shoes_app/constants/images.dart';
import 'package:ecommerce_shoes_app/constants/messaging.dart';
import 'package:ecommerce_shoes_app/constants/style.dart';
import 'package:ecommerce_shoes_app/controller/sign_in_screen_controller.dart';
import 'package:ecommerce_shoes_app/utils/field_validation.dart';
import 'package:ecommerce_shoes_app/utils/input_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EmailIdTextField extends StatelessWidget {
  EmailIdTextField({super.key});
  final signInScreenController = Get.find<SignInScreenController>();

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
        controller: signInScreenController.loginEmailController,
        keyboardType: TextInputType.emailAddress,
        decoration:
            formInputDecoration(hintText: AppMessages.emailId, radius: 30),
        validator: (value) => FieldValidator().validateEmail(value!),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  PasswordTextField({super.key});

  final signInScreenController = Get.find<SignInScreenController>();

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
        controller: signInScreenController.loginPasswordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: signInScreenController.isPasswordVisible.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(8),
        ],
        decoration: formInputDecoration(
          hintText: AppMessages.password,
          radius: 30,
          sufficIcon: IconButton(
            onPressed: () {
              signInScreenController.isLoading(true);
              signInScreenController.isPasswordVisible.value =
                  !signInScreenController.isPasswordVisible.value;
              signInScreenController.isLoading(false);
            },
            icon: Icon(
              signInScreenController.isPasswordVisible.value
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

class LoginButton extends StatelessWidget {
  LoginButton({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

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
          if (signInScreenController.formKey.currentState!.validate()) {
            await signInScreenController.loginUserFunction();
          }
        },
        child: Center(
          child: Text(
            AppMessages.login,
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

class LoginWithFacebookModule extends StatelessWidget {
  const LoginWithFacebookModule({super.key});

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

class LoginWithGoogleModule extends StatelessWidget {
  const LoginWithGoogleModule({super.key});

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
