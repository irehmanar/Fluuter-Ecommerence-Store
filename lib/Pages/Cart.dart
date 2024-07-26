import 'package:fluttertesting/Models/Product.dart';

import 'package:flutter/material.dart';
import 'package:fluttertesting/Widgets/BottomAppBar.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

List<Product> cartProducts = [];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _loadCartProducts();
  }

  Future<void> _loadCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productsString = prefs.getString('cartProducts');
    if (productsString != null) {
      List<dynamic> productList = json.decode(productsString);
      setState(() {
        cartProducts = productList.map((item) => Product.fromJson(item)).toList();
      });
    }
  }

  Future<void> _removeProductFromCart(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productsString = prefs.getString('cartProducts');
    if (productsString != null) {
      List<dynamic> productList = json.decode(productsString);
      List<Product> cartProducts = productList.map((item) => Product.fromJson(item)).toList();
      cartProducts.removeWhere((cartProduct) => cartProduct.name == product.name);
      String updatedProductsString = json.encode(cartProducts.map((product) => product.toJson()).toList());
      await prefs.setString('cartProducts', updatedProductsString);
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartProducts.fold(
      0.0, // Initialize accumulator as a double
          (sum, item) => sum + (double.tryParse(item.price) ?? 0.0),
    );

    return Scaffold(
      backgroundColor: AppColours.backGroundColour,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              ListView.builder(
                itemCount: cartProducts.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = cartProducts[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColours.textFieldColour,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product.imageUrl,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                    color: AppColours.titleColour,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$${product.price}',
                                  style: TextStyle(
                                    color: AppColours.subTitleColour,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline, color: AppColours.buttonColor),
                            onPressed: () async {
                              setState(() {
                                cartProducts.removeAt(index);
                              });
                              await _removeProductFromCart(product);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColours.textFieldColour,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColours.titleColour,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: AppColours.titleColour,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColours.buttonColor,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingCartButton(),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
