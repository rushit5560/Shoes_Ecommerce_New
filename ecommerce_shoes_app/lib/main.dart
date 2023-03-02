import 'package:ecommerce_shoes_app/screen/on_boarding_screen/on_boarding_screen.dart';
import 'package:ecommerce_shoes_app/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final transColor = const Color(0x00000000);
  MaterialColor accentColorSwatch = const MaterialColor(
    0x00000000,
    {
      50: Color(0xFFfeede6),
      100: Color(0xFFfbcab3),
      200: Color(0xFFf8a780),
      300: Color(0xFFf5844d),
      400: Color(0xFFf2611a),
      500: Color(0xFFf04f01),
      600: Color(0xFFd84701),
      700: Color(0xFFc03f01),
      800: Color(0xFFa83701),
      900: Color(0xFF902f01)
    },
  );
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "Roboto",
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
