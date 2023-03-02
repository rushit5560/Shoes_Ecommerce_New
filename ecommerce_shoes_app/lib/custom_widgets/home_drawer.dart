import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:ecommerce_shoes_app/constants/images.dart';
import 'package:ecommerce_shoes_app/constants/userdetails.dart';
import 'package:ecommerce_shoes_app/controller/CustomDrawerController.dart';
import 'package:ecommerce_shoes_app/utils/extensions.dart';
import 'package:ecommerce_shoes_app/utils/user_prefs_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  final customDrawerController = Get.put(CustomDrawerController());
  UserPrefsData commonFunctions = UserPrefsData();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        child: Obx(
              () => customDrawerController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Stack(
               alignment: Alignment.topRight,
               children: [
              Container(
                padding:  EdgeInsets.only(top: 2.h, left: 2.w),
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 5),
                            // UserDetails.isUserLoggedIn == true
                            //     ? profilePicAndName()
                            //     : Container(),
                            profilePicAndName(),
                             //SizedBox(height: 1.h),
                            drawerList(),
                          ],
                        ),
                      ),
                    ),
                    UserDetails.isUserLoggedIn == true ? logout() : login(),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Get.back();
              //   },
              //   child: Container(
              //       height: 25,
              //       width: 25,
              //       margin: EdgeInsets.only(top: 75, right: 20),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Colors.black),
              //       child: Icon(
              //         Icons.close,
              //         color: Colors.white,
              //       )),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  profilePicAndName() {
    return Container(
      margin:  EdgeInsets.only(left: 3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CircleAvatar(
                maxRadius: 8,
                backgroundColor: AppColors.blackColor,
                child: Icon(Icons.close_sharp,size: 12,color: AppColors.whiteColor),
              ).commonOnlyPadding(top: 1.h,right: 3.w),
            ],
          ),
          Container(
            height: 15.h,
            width: 30.w,
            margin: EdgeInsets.only(left: 1.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                  spreadRadius: 2,
                ),
              ],
              image: const DecorationImage(image: AssetImage( AppImages.userImage,),),
            ),

          ),
           SizedBox(height: 1.h),
          Container(
            margin: EdgeInsets.only(left: 1.w),
            child: UserDetails.isUserLoggedIn == true
                ? const Text(
              'login dfnkjknjg',
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )
                : Container(),
          ),
           SizedBox(height: 1.h),
          Container(
            margin: EdgeInsets.only(left: 1.w),
            child: UserDetails.isUserLoggedIn == true
                ? const Text(
              'login eqfgetjry',
              textScaleFactor: 1.1,
              style: TextStyle(color: Colors.black),
            )
                : Container(),
          ),
        ],
      ),
    );
  }

  drawerList() {
    return Container(
       margin: EdgeInsets.only(left: 1.w),
      child: Column(
        children: [
          homeButton(),
/*          newCollection(),
          categories(),
          notification(),
          setting(),
          contactUs(),*/
         // UserDetails.isUserLoggedIn == true ? addressManager() : Container(),
         // UserDetails.isUserLoggedIn == true ? allOrders() : Container(),
          //blogs(),
        ],
      ),
    );
  }

  Widget homeButton() {
    return ListTile(
      onTap: () {
        Get.back();
      },
      leading: Image.asset(
        AppImages.home,
        color: AppColors.blackColor,
        scale: 0.90,
      ),
      minLeadingWidth: 2.w,
     // minVerticalPadding: 4.h,
      title: const Text(
        'Home',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget newCollection() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => CollectionScreen());
      },
      leading: Image.asset(
        AppImages.home,
        color: Colors.black,
        scale: 0.90,
      ),
      minLeadingWidth: 2.w,
      title: const Text(
        //'New Collection',
        'New Collection',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget categories() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => CategoryScreen());
      },
      leading: Image.asset(AppImages.home, color: Colors.black, scale: 0.90),
      minLeadingWidth: 2.w,
      title: const Text(
        'Categories',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget notification() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => NotificationScreen());
      },
      minLeadingWidth: 2.w,
      leading:
      Image.asset(AppImages.notification, color: Colors.black, scale: 0.90),
      title: const Text(
        'Notification',
        textScaleFactor: 1.4,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget setting() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => SettingsScreen());
      },
      minLeadingWidth: 2.w,
      leading: Image.asset(AppImages.setting, color: Colors.black, scale: 0.90),
      title: const Text(
        'Settings',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget contactUs() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => ContactUsScreen());
      },
      minLeadingWidth: 1.3,
      leading: Image.asset(AppImages.home, color: Colors.black, scale: 0.75),
      title: const Text(
        'Contact Us',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget addressManager() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => AddressManagerScreen());
      },
      minLeadingWidth: 30,
      leading: Image.asset(AppImages.home, color: Colors.black, scale: 0.75),
      title: const Text(
        'Address',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget allOrders() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => OrderScreen());
      },
      minLeadingWidth: 30,
      leading: Image.asset(AppImages.home, color: Colors.black, scale: 0.75),
      title: const Text(
        'Orders',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget blogs() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(() => BlogScreen());
      },
      minLeadingWidth: 30,
      leading: Image.asset(AppImages.home, color: Colors.black, scale: 0.75),
      title: const Text(
        'Blogs',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget logout() {
    return ListTile(
      onTap: () async {
        customDrawerController.isLoading(true);

        await commonFunctions.clearUserDetailsFromPrefs();
        // customDrawerController.loadUI();
        customDrawerController.isLoading(false);
        Get.back();
        Get.snackbar("User logout successfully!", "");
        // Get.to(() => SignInScreen());
      },
      minLeadingWidth: 30,
      // leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      leading: const Icon(Icons.logout, color: Colors.black),
      title: const Text(
        'Logout',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget login() {
    return ListTile(
      onTap: () async {
        // Get.back();
        // await commonFunctions.clearUserDetailsFromPrefs();
        // Get.to(() => SignInScreen());
      },
      minLeadingWidth: 30,
      // leading: Image.asset(Images.ic_home, color: Colors.black, scale: 0.75),
      leading: const Icon(Icons.login, color: Colors.black),
      title: const Text(
        'Login',
        textScaleFactor: 1.3,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
