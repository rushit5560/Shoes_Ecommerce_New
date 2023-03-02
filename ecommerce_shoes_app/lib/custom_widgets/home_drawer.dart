import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:ecommerce_shoes_app/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawerModule extends StatelessWidget {
  const HomeDrawerModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: SafeArea(
          child:
          Column(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      DrawerListTileModule(onTap: () {
                        Get.back();
                      }, title: '',
                        imageStatus: false,
                        icon: Icon(Icons.home,
                          color: AppColors.blackColor.withOpacity(0.6)),
                      ),
                    ],
                  )
              )
            ],
          )
      ),
    );
  }
}


// ignore: must_be_immutable
class DrawerListTileModule extends StatelessWidget {
  Function() onTap;
  String title;
  bool imageStatus;
  Icon? icon;
  String? image;
  DrawerListTileModule({
    Key? key,
    required this.onTap,
    required this.title,
    required this.imageStatus,
    this.icon,
    this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
                '',
              height: 2,
              width: 2,
              color: AppColors.blackColor,
            ),
            title: Text(
                '',
              textAlign: TextAlign.left,
              style: TextStyleConfig.drawerTextStyle(),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: AppColors.blackColor,
          )
        ],
      ),
    );
  }
}
