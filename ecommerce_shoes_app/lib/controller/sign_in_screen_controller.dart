import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_shoes_app/constants/api_url.dart';
import 'package:ecommerce_shoes_app/models/sign_in_screen_model/sign_in_model.dart';
import 'package:ecommerce_shoes_app/screen/index_screen/index_screen.dart';
import 'package:ecommerce_shoes_app/utils/common_function.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController loginEmailController =
      TextEditingController(text: "abc@gmail.com");
  TextEditingController loginPasswordController =
      TextEditingController(text: "12345678");

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool isPasswordVisible = true.obs;

  loginUserFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log("loginUserFunction url: $url");
    try {
      Map<String, dynamic> bodyData = {
        "email": loginEmailController.text.trim(),
        "password": loginPasswordController.text.trim()
      };
      log("loginUserFunction passing Data : $bodyData");

      http.Response response = await http.post(Uri.parse(url), body: bodyData);

      log("loginUserFunction response :  ${response.body}");
      SignInDataModel signInDataModel =
          SignInDataModel.fromJson(json.decode(response.body));
      isSuccessStatus = signInDataModel.success.obs;

      if (isSuccessStatus.value) {
        var id = signInDataModel.data.id;
        // var token = signInDataModel.data.rememberToken;
        // var userName = signInDataModel.data.name;
        // var userEmail = signInDataModel.data.email;
        // var password = signInDataModel.data.password;
        log("id: $id ");
        log("loginUserFunction isSuccessStatus :  ${isSuccessStatus.value}");
        Fluttertoast.showToast(msg: signInDataModel.messege);
        await CommonFunctions().setUserDetailsInPrefs(id);
        Get.offAll(() => IndexScreen());
      } else {
        Fluttertoast.showToast(msg: signInDataModel.error);
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading(false);
    }
    // isLoading(true);
    // String url = ApiUrl.loginApi;
    // log("getSignInFunction Url : $url");

    // try {
    //   Map data = {"email": email, "password": password};
    //   log('getSignInFunction data : $data');

    //   http.Response response = await http.post(Uri.parse(url), body: data);

    //   if (response.body.contains('"success": false')) {
    //   } else {}

    //   // When User SignIn Failed
    //   if (response.body.contains('Email don')) {
    //     log('Email Don\'t Match');
    //     Get.snackbar(
    //       'Login Failed !',
    //       'Email Don\'t Match',
    //       colorText: Colors.white,
    //     );
    //   }
    //   if (response.body.contains('password don')) {
    //     log('Password Don\'t Match');
    //     Get.snackbar(
    //       'Login Failed !',
    //       'Password Don\'t Match',
    //       colorText: Colors.white,
    //     );
    //   } //

    //   SignInData signInData = signInDataFromJson(response.body);
    //   isStatus = signInData.success.obs;

    //   if (isStatus.value) {
    //     var id = signInData.data.id;
    //     var token = signInData.data.rememberToken;
    //     var userName = signInData.data.name;
    //     var userEmail = signInData.data.email;

    //     log('id : $id \nToken : $token');
    //     CommonFunctions().setUserDetailsInPrefs(id, token, userName, userEmail);
    //     Get.offAll(() => OnBoardingScreen());
    //     Get.snackbar(
    //       'User Login Successfully.',
    //       '',
    //       colorText: Colors.white,
    //     );
    //   } else {
    //     log('SignIn False');
    //   }
    // } catch (e) {
    //   log('Sign In Error : $e');
    // } finally {
    //   isLoading(false);
    // }
  }
}
