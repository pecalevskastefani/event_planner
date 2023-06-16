import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.pinkAccent,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Container(
          color: Colors.white,
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              // Add functionality for notes icon
              // Customize the behavior when the notes icon is pressed
            },
            icon: Icon(
              Icons.notes,
              size: 40.0,
              color: Colors.pinkAccent,
            ),
          ),
          IconButton(
            onPressed: () {
              // Add functionality for profile icon
              // Customize the behavior when the profile icon is pressed
            },
            icon: Icon(
              Icons.person,
              size: 40.0,
              color: Colors.pinkAccent,
            ),
          ),
        ],
      ),
    );
  }
}