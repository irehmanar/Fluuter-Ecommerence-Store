import 'package:flutter/material.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';
class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomAppBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: AppColours.bottomBarColor,
      notchMargin: 6.0,
      child: Container(
        height: 40.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      Icons.home,
                      key: ValueKey<bool>(selectedIndex == 0),
                      color: selectedIndex == 0 ? AppColours.buttonColor :
                      AppColours.lightIconColor,
                      size: selectedIndex == 0 ? 30.0 : 24.0, // Adjust the size as needed
                    ),
                  ),
                  onPressed: () {
                    onItemTapped(0);
                    Navigator.pushNamed(context, '/');
                  },
                  tooltip: 'Home',
                ),
                IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      Icons.category_sharp,
                      key: ValueKey<bool>(selectedIndex == 1),
                      color: selectedIndex == 1 ? AppColours.buttonColor :
                      AppColours.lightIconColor,
                      size: selectedIndex == 1 ? 30.0 : 24.0, // Adjust the size as needed
                    ),
                  ),
                  onPressed: () {
                    onItemTapped(1);
                    Navigator.pushNamed(context, '/search');
                  },
                  tooltip: 'Category',
                ),
                const SizedBox(width: 40), // The space for the floating button
                IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      Icons.favorite,
                      key: ValueKey<bool>(selectedIndex == 2),
                      color: selectedIndex == 2 ? AppColours.buttonColor :
                      AppColours.lightIconColor,
                      size: selectedIndex == 2 ? 30.0 : 24.0, // Adjust the size as needed
                    ),
                  ),
                  onPressed: () {
                    onItemTapped(2);
                    Navigator.pushNamed(context, '/liked');
                  },
                  tooltip: 'Liked',
                ),
                IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      Icons.person,
                      key: ValueKey<bool>(selectedIndex == 3),
                      color: selectedIndex == 3 ? AppColours.buttonColor :
                      AppColours.lightIconColor,
                      size: selectedIndex == 3 ? 30.0 : 24.0, // Adjust the size as needed
                    ),
                  ),
                  onPressed: () {
                    onItemTapped(3);
                    Navigator.pushNamed(context, '/account');
                  },
                  tooltip: 'Account',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


class FloatingCartButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/cart');
      },
      tooltip: 'Cart',
      shape: const CircleBorder(),
      child: const Icon(Icons.shopping_cart,color: AppColours.lightIconColor,),
      backgroundColor: AppColours.buttonColor,
    );
  }
}