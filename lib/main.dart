import 'package:flutter/material.dart';
import 'package:fluttertesting/Pages/Home.dart';
import 'package:fluttertesting/Pages/Category.dart';
import 'package:fluttertesting/Pages/Favourite.dart';
import 'package:fluttertesting/Pages/Account.dart';
import 'package:fluttertesting/Pages/Cart.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/search': (context) => const SearchPage(),
        '/liked': (context) => const LikedPage(),
        '/account': (context) => const AccountPage(),
        '/cart': (context) => const CartPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
