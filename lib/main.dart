import 'package:flutter/material.dart';
import 'package:fluttertesting/Pages/Home.dart';
import 'package:fluttertesting/Pages/Search.dart';
import 'package:fluttertesting/Pages/Favourite.dart';
import 'package:fluttertesting/Pages/Account.dart';
import 'package:fluttertesting/Pages/Cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'E-Commerce Home'),
        '/search': (context) => const SearchPage(),
        '/liked': (context) => const LikedPage(),
        '/account': (context) => const AccountPage(),
        '/cart': (context) => const CartPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
