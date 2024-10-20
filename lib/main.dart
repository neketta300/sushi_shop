import 'package:flutter/material.dart';
import 'package:sushi_shop/pages/intro_page.dart';
import 'package:sushi_shop/pages/menu_page.dart';

void main() {
  runApp(
    MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: const IntroPageWidget(),
      routes: {
        '/intropage': (context) => const IntroPageWidget(),
        '/menupage': (context) => const MenuPageWidget(),
      },
    ),
  );
}
