import 'package:flutter/material.dart';
import 'package:fluttertesting/Widgets/BottomAppBar.dart';
import 'package:fluttertesting/Widgets/ProductGridDisplay.dart';
import 'package:fluttertesting/Models/Product.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Example product data
  List<Product> menProducts = [
    Product(name: 'Latest Product 1', price: '20', imageUrl: 'https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 2', price: '30', imageUrl: 'https://images.unsplash.com/photo-1547996160-81dfa63595aa?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 3', price: '25', imageUrl: 'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?q=80&w=1388&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 4', price: '40', imageUrl: 'https://images.unsplash.com/photo-1495857000853-fe46c8aefc30?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 1', price: '20', imageUrl: 'https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 2', price: '30', imageUrl: 'https://images.unsplash.com/photo-1547996160-81dfa63595aa?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 3', price: '25', imageUrl: 'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?q=80&w=1388&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 4', price: '40', imageUrl: 'https://images.unsplash.com/photo-1495857000853-fe46c8aefc30?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 1', price: '20', imageUrl: 'https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 2', price: '30', imageUrl: 'https://images.unsplash.com/photo-1547996160-81dfa63595aa?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 3', price: '25', imageUrl: 'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?q=80&w=1388&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Latest Product 4', price: '40', imageUrl: 'https://images.unsplash.com/photo-1495857000853-fe46c8aefc30?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  ];

  List<Product> womenProducts = [
    Product(name: 'Trending Product 1', price: '50', imageUrl: 'https://images.unsplash.com/photo-1495857000853-fe46c8aefc30?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Trending Product 2', price: '60', imageUrl: 'https://images.unsplash.com/photo-1511370235399-1802cae1d32f?q=80&w=1455&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Trending Product 3', price: '45', imageUrl: 'https://images.unsplash.com/photo-1451477334999-a9321157a431?q=80&w=1610&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(name: 'Trending Product 4', price: '55', imageUrl: 'https://images.unsplash.com/photo-1525019461548-85e61dd8e83a?q=80&w=1468&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backGroundColour,
      appBar: AppBar(
        backgroundColor: AppColours.textFieldColour,
        title: Text('Store Online',style: TextStyle(color: AppColours.textColor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColours.lightIconColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColours.buttonColor,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          labelColor: AppColours.textColor,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Men'),
            Tab(text: 'Women'),
            Tab(text: 'Children'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MenTabBarView(),
          WomenTabBarView(),
          ChildrenTabBarView(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingCartButton(),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Padding ChildrenTabBarView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: ProductGrid(products: menProducts),
      ),
    );
  }

  Padding WomenTabBarView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: ProductGrid(products: womenProducts),
      ),
    );
  }

  Padding MenTabBarView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: ProductGrid(products: menProducts),
      ),
    );
  }
}
