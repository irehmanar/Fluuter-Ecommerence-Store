import 'package:flutter/material.dart';
import 'package:fluttertesting/Models/Product.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';

class WatchDetailsPage extends StatelessWidget {
  final Product watch;

  const WatchDetailsPage({required this.watch});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
      body: Stack(
        children: [
          Container(
            color: AppColours.backGroundColour,  // Set the background color to red
            height: screenHeight,  // Set height to 100% vh
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
                          style: TextStyle(fontSize: 24, fontWeight:
                          FontWeight.bold,color: AppColours.textColor),
                        ),
                        Text(
                          'Rs.${watch.price}',
                          style: TextStyle(fontSize: 24, color: AppColours.buttonColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Colors:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight
                          .bold,color: AppColours.textColor),
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
                    SizedBox(height: 80), // Added space to accommodate the floating button
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SwipeToAddCartButton(),
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
  @override
  _SwipeToAddCartButtonState createState() => _SwipeToAddCartButtonState();
}

class _SwipeToAddCartButtonState extends State<SwipeToAddCartButton> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! < 0) {
            // Swipe to the left
            setState(() {
              isAdded = false; // or any logic you want to implement for left swipe
              print('Removed from the cart');
            });
          } else if (details.primaryVelocity! > 0) {
            // Swipe to the right
            setState(() {
              isAdded = true; // or any logic you want to implement for right swipe
              print('Added to the cart');
            });
          }
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isAdded ? AppColours.buttonColor : AppColours.inactiveButtonColor,
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
