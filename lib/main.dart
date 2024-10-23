import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/models/shop.dart';
import 'package:sushi_shop/pages/cart_page.dart';
import 'package:sushi_shop/pages/intro_page.dart';
import 'package:sushi_shop/pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: const IntroPageWidget(),
      routes: {
        '/intropage': (context) => const IntroPageWidget(),
        '/menupage': (context) => const MenuPageWidget(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
