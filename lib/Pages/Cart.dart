import 'package:flutter/material.dart';
import 'package:fluttertesting/Widgets/BottomAppBar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Cart Page'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingCartButton(),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
