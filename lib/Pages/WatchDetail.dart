import 'package:flutter/material.dart';
import 'package:fluttertesting/Models/Product.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WatchDetailsPage extends StatelessWidget {
  final Product watch;

  const WatchDetailsPage({required this.watch});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColours.textFieldColour,
        title: Text(
          'Store Online',
          style: TextStyle(color: AppColours.textColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColours.lightIconColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColours.backGroundColour,
            height: screenHeight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 450,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          watch.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          watch.name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColours.textColor),
                        ),
                        Text(
                          'Rs.${watch.price}',
                          style: TextStyle(
                              fontSize: 24,
                              color: AppColours.buttonColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Colors:',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColours.textColor),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        ColorOption(color: Colors.black),
                        ColorOption(color: Colors.grey),
                        ColorOption(color: Colors.blue),
                        ColorOption(color: Colors.green),
                      ],
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SwipeToAddCartButton(product: watch),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;

  const ColorOption({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class SwipeToAddCartButton extends StatefulWidget {
  final Product product;

  const SwipeToAddCartButton({required this.product});

  @override
  _SwipeToAddCartButtonState createState() => _SwipeToAddCartButtonState();
}

class _SwipeToAddCartButtonState extends State<SwipeToAddCartButton> {
  bool isAdded = false;

  @override
  void initState() {
    super.initState();
    _checkIfAdded();
  }

  Future<void> _checkIfAdded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productsString = prefs.getString('cartProducts');
    if (productsString != null) {
      List<dynamic> productList = json.decode(productsString);
      List<Product> cartProducts =
      productList.map((item) => Product.fromJson(item)).toList();
      setState(() {
        isAdded = cartProducts
            .any((product) => product.name == widget.product.name);
      });
    }
  }

  Future<void> _addProductToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productsString = prefs.getString('cartProducts');
    List<Product> cartProducts = [];
    if (productsString != null) {
      List<dynamic> productList = json.decode(productsString);
      cartProducts =
          productList.map((item) => Product.fromJson(item)).toList();
    }
    cartProducts.add(widget.product);
    String updatedProductsString =
    json.encode(cartProducts.map((product) => product.toJson()).toList());
    await prefs.setString('cartProducts', updatedProductsString);
  }

  Future<void> _removeProductFromCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productsString = prefs.getString('cartProducts');
    if (productsString != null) {
      List<dynamic> productList = json.decode(productsString);
      List<Product> cartProducts =
      productList.map((item) => Product.fromJson(item)).toList();
      cartProducts.removeWhere(
              (product) => product.name == widget.product.name);
      String updatedProductsString =
      json.encode(cartProducts.map((product) => product.toJson()).toList());
      await prefs.setString('cartProducts', updatedProductsString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) async {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! < 0) {
            setState(() {
              isAdded = false;
            });
            print('Removed from the cart');
            await _removeProductFromCart();

          } else if (details.primaryVelocity! > 0) {
            setState(() {
              isAdded = true;
            });
            await _addProductToCart();
            print('Added to the cart');
          }
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isAdded
              ? AppColours.buttonColor
              : AppColours.inactiveButtonColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            isAdded ? 'Added to Cart' : 'Swipe to Add to Cart',
            style: TextStyle(color: AppColours.textColor, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

