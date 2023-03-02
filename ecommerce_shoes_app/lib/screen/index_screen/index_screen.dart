import 'dart:developer';

import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:ecommerce_shoes_app/constants/userdetails.dart';
import 'package:ecommerce_shoes_app/controller/index_screen_controller.dart';
import 'package:ecommerce_shoes_app/screen/authantication_screen/sign_In_screen/sign_in_screen.dart';
import 'package:ecommerce_shoes_app/screen/home_screen/home_screen.dart';
import 'package:ecommerce_shoes_app/screen/notification_screen/notification_screen.dart';
import 'package:ecommerce_shoes_app/screen/profile_screen/profile_screen.dart';
import 'package:ecommerce_shoes_app/screen/settings_screen/settings_screen.dart';
import 'package:ecommerce_shoes_app/screen/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});
  final indexScreenController = Get.put(IndexScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          child: getMenuByIndex,
        ),
      ),
      bottomNavigationBar: Obx(() => naviBar(context, changeIndex)),
    );
  }

  Widget naviBar(BuildContext context, changeIndex) {
    return Container(
      height: Get.height * 0.07,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(25),
        //   topRight: Radius.circular(25),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (UserDetails.isUserLoggedIn == true) {
                changeIndex.call(0);
                log("${indexScreenController.menuIndex.value}");

                indexScreenController.menuIndex.value = 0;
              } else {
                Get.to(() => SignInScreen(), transition: Transition.zoom);
              }
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.notification_important,
                color: indexScreenController.menuIndex.value == 0
                    ? AppColors.darkPinkColor
                    : Colors.grey,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (UserDetails.isUserLoggedIn == true) {
                changeIndex.call(1);
                log("${indexScreenController.menuIndex.value}");

                indexScreenController.menuIndex.value = 1;
              } else {
                Get.to(() => SignInScreen(), transition: Transition.zoom);
              }
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.settings,
                color: indexScreenController.menuIndex.value == 1
                    ? AppColors.darkPinkColor
                    : Colors.grey,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(2);
              log("${indexScreenController.menuIndex.value}");

              indexScreenController.menuIndex.value = 2;
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.home,
                color: indexScreenController.menuIndex.value == 2
                    ? AppColors.darkPinkColor
                    : Colors.grey,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (UserDetails.isUserLoggedIn == true) {
                changeIndex.call(3);
                log("${indexScreenController.menuIndex.value}");

                indexScreenController.menuIndex.value = 3;
              } else {
                Get.to(() => SignInScreen(), transition: Transition.zoom);
              }
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.favorite,
                color: indexScreenController.menuIndex.value == 3
                    ? AppColors.darkPinkColor
                    : Colors.grey,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (UserDetails.isUserLoggedIn == true) {
                changeIndex.call(4);
                log("${indexScreenController.menuIndex.value}");

                indexScreenController.menuIndex.value = 4;
              } else {
                Get.to(() => SignInScreen(), transition: Transition.zoom);
              }
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                Icons.person,
                color: indexScreenController.menuIndex.value == 4
                    ? AppColors.darkPinkColor
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeIndex(int index) {
    indexScreenController.menuIndex.value = index;
  }

  Widget get getMenuByIndex {
    log("menuIndex -> " + indexScreenController.menuIndex.toString());

    if (indexScreenController.menuIndex.value == 0) {
      return NotificationScreen();
    } else if (indexScreenController.menuIndex.value == 1) {
      return SettingsScreen();
    } else if (indexScreenController.menuIndex.value == 2) {
      return HomeScreen();
    } else if (indexScreenController.menuIndex.value == 3) {
      return WishListScreen();
    } else {
      return ProfileScreen();
    }
  }
}
