import 'package:flutter/material.dart';
import 'package:shop_nest/utils/theme/theme.dart';


class ShopNest extends StatelessWidget {
  const ShopNest({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(),
    );
  }
}