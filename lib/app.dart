import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop_nest/features/authentication/screens/log_sign_screen/sign_up_screen.dart';
import 'features/authentication/screens/log_sign_screen/sign_in_screen.dart';

class ShopNest extends StatelessWidget {
  const ShopNest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}