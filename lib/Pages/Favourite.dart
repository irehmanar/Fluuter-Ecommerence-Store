import 'package:flutter/material.dart';
import 'package:fluttertesting/Models/Product.dart';
import 'package:fluttertesting/Widgets/BottomAppBar.dart';
import 'package:fluttertesting/Widgets/ProductListDisplay.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  _LikedPageState createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Example product data
  List<Product> favouriteProducts = [
    Product(
        name: 'Latest Product 1',
        price: '1999',
        imageUrl:
        'https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'Latest Product 2',
        price: '3499',
        imageUrl:
        'https://images.unsplash.com/photo-1547996160-81dfa63595aa?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'Latest Product 3',
        price: '2499',
        imageUrl:
        'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?q=80&w=1388&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'Latest Product 4',
        price: '4999',
        imageUrl:
        'https://images.unsplash.com/photo-1495857000853-fe46c8aefc30?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  ];

  // Example product data
  List<String> products1 = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
    'Product 6',
    'Product 7',
    'Product 8',
    'Product 9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backGroundColour, // Set the background color
      appBar: AppBar(
        backgroundColor:  AppColours.appbarColor,
        title: Text('Store Online',style: TextStyle(color: AppColours.textColor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColours.lightIconColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListofItemsDisplay(productsItems: favouriteProducts),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingCartButton(),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
