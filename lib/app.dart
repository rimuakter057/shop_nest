import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';

class ShopNest extends StatelessWidget {
  const ShopNest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}