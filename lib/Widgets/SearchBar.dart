import 'package:flutter/material.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';

class Searchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: AppColours.inactiveButtonColor, // Set the cursor color
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: AppColours.inactiveButtonColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: AppColours.inactiveButtonColor), // Set the default border color
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: AppColours.inactiveButtonColor), // Set the focused border color
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: AppColours.inactiveButtonColor), // Set the enabled border color
              ),
              prefixIcon: Icon(Icons.search, color: AppColours.inactiveButtonColor),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
