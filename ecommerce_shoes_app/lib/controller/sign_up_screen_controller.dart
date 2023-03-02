import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_shoes_app/models/sign_up_screen/sign_up_model.dart';
import 'package:ecommerce_shoes_app/screen/index_screen/index_screen.dart';
import 'package:ecommerce_shoes_app/utils/common_function.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_shoes_app/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isPasswordVisible = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController signUpNamedController =
      TextEditingController(text: "abc");
  TextEditingController signUpEmailController =
      TextEditingController(text: "abc@gmail.com");
  TextEditingController signUpPasswordController =
      TextEditingController(text: "12345678");
  // TextEditingController confirmPasswordController =
  //     TextEditingController(text: "12345678");

  CommonFunctions commonFunctions = CommonFunctions();

  Future<void> signUpUserFunction() async {
    isLoading(true);
    String url = ApiUrl.registerApi;
    log("signUpUserFunction url: $url");

    try {
      Map<String, dynamic> bodyData = {
        "name": signUpNamedController.text.trim(),
        "email": signUpEmailController.text.trim(),
        "password": signUpPasswordController.text.trim(),
        "c_password": signUpPasswordController.text.trim(),
      };
      log("signUpUserFunction passing Data : $bodyData");

      http.Response response = await http.post(Uri.parse(url), body: bodyData);
      log("signUpUserFunction response :  ${response.body}");

      SignUpModel signUpModel =
          SignUpModel.fromJson(json.decode(response.body));

      isSuccessStatus = signUpModel.success.obs;
      if (isSuccessStatus.value) {
        String id = signUpModel.data[0].id.toString();
        // String name = signUpModel.data[0].name.toString();
        // String email = signUpModel.data[0].email.toString();

        await commonFunctions.setUserDetailsInPrefs(id);
        Get.offAll(() => IndexScreen());
      } else {
        Fluttertoast.showToast(msg: signUpModel.error.email[0]);
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}
