import 'package:flutter/material.dart';
import 'package:shop_nest/features/authentication/screens/team_list_screen/team_list_screen.dart';

class ShopNest extends StatelessWidget {
  const ShopNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: TeamListScreen(),
    );
  }
}