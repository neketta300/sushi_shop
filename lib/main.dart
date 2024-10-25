import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/auth/auth.dart';
import 'package:sushi_shop/auth/login_or_register.dart';
import 'package:sushi_shop/firebase_options.dart';
import 'package:sushi_shop/models/shop.dart';
import 'package:sushi_shop/pages/cart_page.dart';
import 'package:sushi_shop/pages/intro_page.dart';

import 'package:sushi_shop/pages/menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      debugShowCheckedModeBanner: false,
      home: const IntroPageWidget(),
      //home: IntroPageWidget(),
      routes: {
        '/auth': (contex) => const AuthPage(),
        '/intropage': (context) => const IntroPageWidget(),
        '/loginorregistation': (context) => const LoginOrRegister(),
        '/menupage': (context) => const MenuPageWidget(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
