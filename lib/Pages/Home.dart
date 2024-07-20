import 'package:flutter/material.dart';

import 'package:fluttertesting/Widgets/BottomAppBar.dart';
import 'package:fluttertesting/Widgets/SearchBar.dart';
import 'package:fluttertesting/Widgets/ProductGridDisplay.dart';

import 'package:fluttertesting/Models/Product.dart';

import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Example product data
  List<Product> latestProducts = [
    Product(
        name: 'Latest Product 1',
        price: '20',
        imageUrl:
        'https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'Latest Product 2',
        price: '30',
        imageUrl:
        'https://images.unsplash.com/photo-1547996160-81dfa63595aa?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'Latest Product 3',
        price: '25',
        imageUrl:
        'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?q=80&w=1388&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'Latest Product 4',
        price: '40',
        imageUrl:
        'https://images.unsplash.com/photo-1495857000853-fe46c8aefc30?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  ];

  List<Product> trendingProducts = [
    Product(
        name: 'Trending Product 1',
        price: '50',
        imageUrl:
        'https://images.unsplash.com/photo-1495857000853-fe46c8aefc30?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'Trending Product 2',
        price: '60',
        imageUrl:
        'https://images.unsplash.com/photo-1511370235399-1802cae1d32f?q=80&w=1455&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'Trending Product 3',
        price: '45',
        imageUrl:
        'https://images.unsplash.com/photo-1451477334999-a9321157a431?q=80&w=1610&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'Trending Product 4',
        price: '55',
        imageUrl:
        'https://images.unsplash.com/photo-1525019461548-85e61dd8e83a?q=80&w=1468&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backGroundColour,
      body: HomePageBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingCartButton(),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  SingleChildScrollView HomePageBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            // Search Bar
            Searchbar(),
            SizedBox(height: 20),
            // Category Circular Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularCategoryButton(title: 'Men', icon: Icons.boy_outlined),
                CircularCategoryButton(
                    title: 'Women', icon: Icons.girl_outlined),
                CircularCategoryButton(
                    title: 'Children', icon: Icons.child_care),
              ],
            ),
            SizedBox(height: 20),
            // Latest Products Section
            SectionTitle(title: 'Latest Products'),
            ProductGrid(products: latestProducts),
            SizedBox(height: 20),
            // Trending Products Section
            SectionTitle(title: 'Trending Items'),
            ProductGrid(products: trendingProducts),
            SizedBox(height: 20),
            // More Sections or Widgets as needed
          ],
        ),
      ),
    );
  }
}

class CircularCategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const CircularCategoryButton({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(
            icon,
            size: 30,
            color: AppColours.lightIconColor,
          ),
          backgroundColor: AppColours.buttonColor, // You can change the background color as needed
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: AppColours.textColor),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColours.textColor),
          ),
          Row(
            children: [
              Text(
                "Show more",
                style: TextStyle(color: AppColours.buttonColor),
              ),
              Icon(Icons.arrow_forward, color: AppColours.buttonColor),
            ],
          ),
        ],
      ),
    );
  }
}
